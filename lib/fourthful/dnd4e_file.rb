# A given Fourthful::DND4E_File points to a file and knows how to extract data from it.
class Fourthful
  
  module TextHelpers
    def blank?(str)
      !str || (str.respond_to?(:empty?) && str.empty?)
    end

    def present?(str)
      !blank?(str)
    end
    
    def capitalize(str)
      return str unless present?(str)
      str.split(" ").map do |substr|
        substr[0].upcase + substr[1..-1]
      end.join(" ")
    end
  end
  
  module SearchHelpers
    def find_first_once(search_string)
      @doc.search("#{search_string}").first
    end
    
    def find_first(search_string, key="")
      key = key && key.to_s.gsub("_", " ")
      if blank?(key)
        value = find_first_once(search_string)
      else
        value = find_first_once(search_string.sub(":key", key))
        value ||= find_first_once(search_string.sub(":key", capitalize(key)))
        value ||= find_first_once(search_string.sub(":key", key.downcase))
        value ||= find_first_once(search_string.sub(":key", key.upcase))
      end
      value
    end
    
    def get_value_from_element(el)
      # attempt to extract value
      value = if el.nil?
        nil
      elsif present?(el['value'])
        el['value'].strip
      elsif present?(el['name'])
        el['name'].strip
      elsif present?(el.inner_text && el.inner_text.strip)
        el.inner_text.strip
      else
        nil
      end
      
      # convert to integer if possible
      if value =~ /^[0-9]+$/
        value = value.to_i
      end
      
      value
    end
  end
  
  class DND4E_File
    include TextHelpers
    include SearchHelpers

    ATTRIBUTE_ALIASES = {
      "hp" => "Hit Points",
      "xp" => "Experience",
      "gold" => "CarriedMoney",
      "character_class" => "Class",
      "str_mod" => "Strength modifier",
      "dex_mod" => "Dexterity modifier",
      "con_mod" => "Constitution modifier",
      "wis_mod" => "Wisdom modifier",
      "int_mod" => "Intelligence modifier",
      "cha_mod" => "Charisma modifier",
    }
    
    attr_accessor :doc

    def initialize(filename)
      @doc = Nokogiri::XML(File.read(filename))
    end
    
    def [](key)
      if respond_to?("get_attribute_#{key}")
        send("get_attribute_#{key}")
      elsif ATTRIBUTE_ALIASES[key.to_s.downcase]
        get_attribute_default(ATTRIBUTE_ALIASES[key.to_s.downcase])
      else
        get_attribute_default(key)
      end
    end
    
    private      
      def get_attribute_default(attr)
        if el = find_first("Details :key", attr)
          value = get_value_from_element(el)
          return value if value
        end
        
        if el = find_first("RulesElement[type=':key']", attr)
          value = get_value_from_element(el)
          return value if value          
        end
        
        if el = find_first("StatBlock Stat alias[name=':key']", attr)
          value = get_value_from_element(el.parent)
          return value if value          
        end

        return nil
      end
      
  end
end
