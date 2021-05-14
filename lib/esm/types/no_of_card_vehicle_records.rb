require "esm/types/base"

class Esm::Types::NoOfCardVehicleRecords < Esm::Types::Integer
  def initialize
    super(2)
  end
end
