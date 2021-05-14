require "esm/types/base"

class Esm::Types::NoOfCardPlaceRecords < Esm::Types::Integer
  def initialize
    super(1)
  end
end
