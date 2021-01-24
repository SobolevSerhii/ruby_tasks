require 'pry'
module Truncate
  def truncate(attribute, length:)
    instance_variable_set(:@truncate_attribute, attribute.to_s)
    instance_variable_set(:@truncate_length, length.to_i)
  end

  def self.extended(klass)
    class << klass
      alias_method :__new, :new

      def new(str)
        truncate_string = str.slice(0..instance_variable_get(:@truncate_length) - 1)
        e = __new(truncate_string)
        e
      end
    end
  end
end
