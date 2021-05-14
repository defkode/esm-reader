require "esm/types/base"

class Esm::Types::CardEventRecord < Esm::Types::Base
  def sequence
    {
      "eventType"                => "EventFaultType", # 1
      "eventBeginTime"           => "TimeReal", # 4
      "eventEndTime"             => "TimeReal", # 4
      "eventVehicleRegistration" => "VehicleRegistrationIdentification" # 15
    }
  end

  def initialize
    super(24)
  end

  def read(file)
    read_sequence(file)
  end
end
