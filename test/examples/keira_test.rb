require 'test_helper'

class KeiraExampleTest < Test::Unit::TestCase
  def setup
    @filename = File.join(TEST_DATA_DIR, 'Keira.dnd4e')
    assert File.exists?(@filename)
  end
  
  def test_meh
    assert File.exists?(@filename)
  end
end