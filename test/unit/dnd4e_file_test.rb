require 'test_helper'

class DND4E_FileTest < Test::Unit::TestCase
  def setup
    @file = Fourthful::DND4E_File.new(File.join(TEST_DATA_DIR, 'Keira.dnd4e'))
  end
  
  def test_attributes
    assert @file
    %w{
      name level class race level experience CarriedMoney
      Hit\ Points  Healing\ Surges
      initiative speed
      AC Will Fortitude Reflex
      STR DEX CON WIS INT CHA
      Strength Dexterity Constitution
      Intelligence Wisdom Charisma
      Strength\ modifier
      Dexterity\ modifier
      Constitution\ modifier
      Intelligence\ modifier
      Wisdom\ modifier
      Charisma\ modifier
      str_mod cha_mod
    }.each do |attr|
      assert @file[attr], "could not find attribute \"#{attr}\""
      puts "#{attr}: #{@file[attr]}" if ENV['DEBUG']
    end
  end
  
  def test_aliases
    %w{
      xp gold hp
    }.each do |attr|
      assert @file[attr], "could not find attribute \"#{attr}\""
      puts "#{attr}: #{@file[attr]}" if ENV['DEBUG']
    end
  end
  
end