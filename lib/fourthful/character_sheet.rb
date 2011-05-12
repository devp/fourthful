# this somehow has logic for a transform, given a template
class Fourthful
  class CharacterSheet
    class HTML
      def initialize(template_filename)
        @template = File.read(template_filename)
      end
      
      def render(character)
        doc = Nokogiri::HTML(@template)
        Character::DND4E_ATTRIBUTES.each do |attr|
          doc.css(".fourthful-#{attr}").each do |el|
            el.inner_html = character[attr].to_s
          end
        end
        doc.to_s
      end
    end
  end
end
