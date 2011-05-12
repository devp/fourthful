class Fourthful
  class Power
    POWER_ATTRIBUTES = [:name, :power_usage, :keywords, :action_type, :attack_type, 
                        :target, :power_type, :trigger, :hit, :miss, :effect,
                        :attack_bonus, :attack_stat, :defense, :damage, :damage_type,
                        :special, :requirement, :prerequisite]
    
    attr_accessor :attributes

    def initialize(initial_attributes={})
      @attributes = {}
      POWER_ATTRIBUTES.each do |k|
        if initial_attributes[k]
          @attributes[k] = initial_attributes[k]
        end
      end
    end

    def [](key)
      if respond_to?(key)
        send(key)
      else
        attributes[key]
      end
    end
    
    def []=(key, value)
      attributes[key] = value
    end
    
    def self.from_dnd4e_file_and_power_name(file, power_name)
      dnd4e_file = Fourthful::DND4E_File.new(dnd4e_file) if dnd4e_file.is_a?(String)
      power = Power.new(:name => power_name)
      POWER_ATTRIBUTES.each do |k|
        v = file.get_power_attribute(power_name, k)
        power[k] = v if v
      end
      power
    end
    
    def to_s
      "Power: #{self[:name]} (#{self[:power_usage]})"
    end

  end
end