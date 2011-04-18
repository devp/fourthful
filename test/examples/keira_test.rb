require 'test_helper'

class KeiraExampleTest < Test::Unit::TestCase
  def setup
    @filename = File.join(TEST_DATA_DIR, 'Keira.dnd4e')
  end
  
  def test_meh
    assert File.exists?(@filename)
  end
end