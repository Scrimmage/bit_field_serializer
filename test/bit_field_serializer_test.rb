require_relative './test_helper'

class TestBitFieldSerializer < MiniTest::Test

  def setup
    @serializer = Class.new
    @serializer.extend(BitFieldSerializer)
  end

  def collection
    { 'enum1' => 0, 'enum2' => 1, 'enum3' => 2, 'enum4' => 4, 'enum5' => 8, 'enum6' => 16 }
  end

  def test_converts_enum_array_to_integer
    integer = @serializer.enum_array_to_integer([ 0, 1, 2, 4, 8, 16 ])
    assert_equal(31, integer)
  end

  def test_conversion_ignores_nil_values
    integer = @serializer.enum_array_to_integer([ nil, 1, 2, nil, 4, 8, 16, nil ])
    assert_equal(31, integer)
  end

  def test_integer_to_enum_array_with_31
    result = @serializer.integer_to_enum_array(collection, 31)

    assert_equal([0, 1, 2, 4, 8, 16], result)
  end

  def test_integer_to_enum_array_missing_power_in_enum
    collection = { 'enum1' => 0, 'enum2' => 1, 'enum3' => 2, 'enum5' => 8, 'enum6' => 16 }

    result = @serializer.integer_to_enum_array(collection, 31)

    assert_equal([0, 1, 2, 8, 16], result)
  end

  def test_integer_to_enum_array_with_16
    result = @serializer.integer_to_enum_array(collection, 16)

    assert_equal([0, 16], result)
  end

  def test_integer_to_enum_array_with_2
    result = @serializer.integer_to_enum_array(collection, 2)

    assert_equal([0, 2], result)
  end

  def test_integer_to_enum_array_with_22
    result = @serializer.integer_to_enum_array(collection, 22)

    assert_equal([0, 2, 4, 16], result)
  end

  def test_conversion_and_deconversion_with_2
    result = @serializer.integer_to_enum_array(collection, 2)

    assert_equal([0, 2], result)

    integer = @serializer.enum_array_to_integer(result)

    assert_equal(2, integer)
  end

  def test_conversion_and_deconversion_with_12
    result = @serializer.integer_to_enum_array(collection, 12)

    assert_equal([0, 4, 8], result)

    integer = @serializer.enum_array_to_integer(result)

    assert_equal(12, integer)
  end
end
