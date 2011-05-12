
# require 'dnd/power'

class Fourthful
  class Character
    
    DND4E_ATTRIBUTES = [
      :name, :level, :character_class, :race,
      :level, :xp, :gold,
      :hp, :healing_surges,
      # :bloodied_hp, :healing_surge_value, :temp_hp, # derived or temporary
      :initiative, :speed,
      :ac, :fortitude, :reflex, :will,
      # :skills,
      :passive_perception, :passive_insight,
      :str, :dex, :con, :wis, :int, :cha,
      :str_mod, :dex_mod, :con_mod, :wis_mod, :int_mod, :cha_mod,
      # :powers,
      # :power_points,
      # :magic_items, :features, :equipment, :rituals, :backgrounds # ?
    ]
    
    attr_accessor :attributes
    
    def initialize(initial_attributes={})
      @attributes = {}
      DND4E_ATTRIBUTES.each do |k|
        if initial_attributes[k]
          @attributes[k] = initial_attributes[k]
        end
      end
    end
        
    def from_dnd4e_file(dnd4e_file)
      dnd4e_file = Fourthful::DND4E_File.new(dnd4e_file) if dnd4e_file.is_a?(String)
      character = Character.new
      DND4E_ATTRIBUTES.each do |attr|
        character[attr] = dnd4e_file[attr]
      end
      character
    end
    
    def [](key)
      attributes[key]
    end
    
    def []=(key, value)
      attributes[key] = value
    end
    
  end
end
