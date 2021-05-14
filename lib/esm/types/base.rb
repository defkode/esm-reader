module Esm
  module Types
    class Base
      attr_reader :length

      def initialize(length)
        @length = length
      end

      def read_sequence(file)
        sequence.inject({}) do |memo, (key, definition)|
          type, length = definition.split("^")

          if length
            reader = "Esm::Types::#{type}".constantize.new(length.to_i)
          else
            reader = "Esm::Types::#{type}".constantize.new
          end

          memo[key] = reader.read(file)
          memo
        end
      end
    end
  end
end
