require 'test_helper'

class IrruosExampleTest < Test::Unit::TestCase
  def setup
    @filename = File.join(TEST_DATA_DIR, 'Irruos.dnd4e')
    assert File.exists?(@filename)
  end

  def test_meh
    assert File.exists?(@filename)
  end
end