class Array
  def rebuild!
    new_array = []
    return self unless block_given?

    each do |element|
      if element.is_a? Integer
        new_array << yield(element)
      elsif element.is_a? Array
        new_new_array = []
        element.each do |x|
          new_new_array << yield(x)
        end
        new_array << new_new_array
      elsif element.is_a? String
        new_array << yield(element.to_s)
      end
    end
    new_array
  end
end
