require "esm/types/base"

class VehicleRegistrationNumber < Esm::Types::Base
  def sequence
    {
      "codePage"         => "Integer", # 1
      "vehicleRegNumber" => "OctetString^13" # 13
    }
  end

  def initialize
    super(14)
  end

  def read(file)
    read_sequence(file)
  end
end
