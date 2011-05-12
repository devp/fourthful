class Fourthful
  class Character

    attr_accessor :attributes, :dnd4e_file
    
    DND4E_BASE_ATTRIBUTES = [
      :name, :level, :character_class, :race,
      :level, :xp, :gold,
      :hp, :healing_surges,
      :initiative, :speed,
      :ac, :fortitude, :reflex, :will,
      :passive_perception, :passive_insight,
      :str, :dex, :con, :wis, :int, :cha,
      :str_mod, :dex_mod, :con_mod, :wis_mod, :int_mod, :cha_mod,
      :background,
      :class_features, :racial_traits, :feats,
      :powers,
    ] + Skill::SKILL_LIST + Skill::SKILL_LIST.map{|skill| "#{skill} Trained"}

    DND4E_DERIVED_ATTRIBUTES = [
      :bloodied_hp, :healing_surge_value, :features
    ]
    
    # DND4E_TEMPORARY_ATTRIBUTES = [ :temp_hp ] # to be used later?
    
    DND4E_ATTRIBUTES = DND4E_BASE_ATTRIBUTES + DND4E_DERIVED_ATTRIBUTES

    def initialize(initial_attributes={})
      @attributes = {}
      DND4E_ATTRIBUTES.each do |k|
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
        
    def self.from_dnd4e_file(dnd4e_file)
      dnd4e_file = Fourthful::DND4E_File.new(dnd4e_file) if dnd4e_file.is_a?(String)
      character = Character.new
      character.dnd4e_file = dnd4e_file
      DND4E_ATTRIBUTES.each do |attr|
        character[attr] = dnd4e_file[attr]
      end
      character
    end
    
    def bloodied_hp
      self[:hp] / 2
    end
    
    def healing_surge_value
      self[:hp] / 4
    end
    
    def features
      self[:class_features] + self[:racial_traits] + self[:feats]
    end
        
  end
end
