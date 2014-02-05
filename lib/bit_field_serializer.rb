require "bit_field_serializer/version"

module BitFieldSerializer
  def enum_array_to_integer(array)
    array.compact.reduce(0) { |bit_field, t| bit_field |= t.to_i; bit_field }
  end

  def integer_to_enum_array(collection, integer)
    collection.values.collect { |t| t if (integer & t == t) }.compact
  end
end
