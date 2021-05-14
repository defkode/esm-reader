require "esm/types/base"

class VehicleRegistrationIdentification < Esm::Types::Base
  def sequence
    {
      "vehicleRegistrationNation" => "NationNumeric", # 1
      "vehicleRegistrationNumber" => "VehicleRegistrationNumber" # 14
    }
  end

  def initialize
    super(15)
  end

  def read(file)
    read_sequence(file)
  end
end
