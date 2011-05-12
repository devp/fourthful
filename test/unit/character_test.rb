require 'test_helper'

class CharacterTest < Test::Unit::TestCase
  def setup
    file = Fourthful::DND4E_File.new(File.join(TEST_DATA_DIR, 'Keira.dnd4e'))
    @char = Fourthful::Character.new(file)

  end

  def test_created_from_dnd4e_file
    assert @char
  end
  
  def test_base_attributes
    Fourthful::Character::DND4E_BASE_ATTRIBUTES.each do |attr|
      assert @char[attr], "could not find attribute \"#{attr}\""
      puts "#{attr}: #{@char[attr]}" if ENV['DEBUG']
    end
  end
  
  def test_derived_attributes
    Fourthful::Character::DND4E_DERIVED_ATTRIBUTES.each do |attr|
      assert @char[attr], "could not find attribute \"#{attr}\""
      puts "#{attr}: #{@char[attr]}" if ENV['DEBUG']
    end
  end
  
  def test_powers
    power = @char[:powers].last
    assert power.is_a?(Fourthful::Power)
    assert power[:name]
    assert power[:action_type]
    assert power[:defense]
    puts @char[:powers] if ENV['DEBUG']
  end
  
end
