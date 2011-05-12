require 'test_helper'

class CharacterSheetTest < Test::Unit::TestCase
  def test_one_sheet
    tmpl = Fourthful::CharacterSheet::HTML.new('tmp/tmpl.html')
    char = Fourthful::Character.from_dnd4e_file('tmp/A.4e')
    output = tmpl.render(char)
    assert output
    puts output if ENV['DEBUG']
  end
end