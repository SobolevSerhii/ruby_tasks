# frozen_string_literal: true

class Array
  def rebuild!
    new_array = []
    return self unless block_given?

    each do |element|
      if element.is_a? Integer
        new_array <<  yield(element)
      elsif element.is_a? Array
        new_new_array = []
        element.each do |x|
          new_new_array << yield(x)
        end
        new_array << new_new_array
      elsif element.is_a? String
        new_array << yield(element)
      end
    end
    new_array
  end
end

# # # @examples # # #
# pry(main)> ['a', 'b', 'c'].rebuild! do |x, size|
# pry(main)*   size = 5.to_s
# pry(main)*   x + size
# pry(main)* end
# => ["a5", "b5", "c5"]

# pry(main)> [2, [2,5], 7].rebuild! do |x, size|
# pry(main)*   size = 5
# pry(main)*   x + size
# pry(main)* end
# => [7, [7, 10], 12]
