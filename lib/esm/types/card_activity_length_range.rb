require "esm/types/base"

class Esm::Types::CardActivityLengthRange < Esm::Types::Integer
  # 0..65535
  def initialize
    super(2)
  end
end
