require 'test_helper'

class CharacterTest < Test::Unit::TestCase
  def test_create_from_dnd4e_file
    file = Fourthful::DND4E_File.new(File.join(TEST_DATA_DIR, 'Keira.dnd4e'))
    char = Fourthful::Character.new(file)
    Fourthful::Character::DND4E_ATTRIBUTES.each do |attr|
      assert char[attr] && !char[attr].empty?, "could not find attribute \"#{attr}\""
    end
  end
end
