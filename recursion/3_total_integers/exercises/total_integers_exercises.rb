def total_integers(array)
  # Count the total number of integers inside of the given array
  # The array may be nested, and the integers inside these "inner" layers must also be counted
  #
  # Example: `total_integers([0, 1, [5]]) == 3`
  #
  # NOTE: you may notice that `Array#flatten` would make quick work of this,
  # but you should implement this method without using it. The tests will check
  # to make sure `#flatten` isn't used.
  curr_level_count = array.filter { |element| element.is_a?(Integer) }.length
  
  nested_arrays = array.filter { |element| element.is_a?(Array) }
  nested_count =  nested_arrays.reduce(0) do |acc, nested_array|
    acc + total_integers(nested_array)
  end
  curr_level_count + nested_count
end
