require_relative './test_helper'

class TestBitFieldSerializer < MiniTest::Test

  def test_version_is_correct
    assert_equal BitFieldSerializer::VERSION, '0.0.1'
  end
end
