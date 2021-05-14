require "esm/types/base"

class Esm::Types::DriverCardApplicationIdentification < Esm::Types::Base
  def sequence
    {
      "typeOfTachographCardId"  => "EquipmentType",           # 1
      "cardStructureVersion"    => "CardStructureVersion",    # 2
      "noOfEventsPerType"       => "NoOfEventsPerType",       # 1
      "noOfFaultsPerType"       => "NoOfFaultsPerType",       # 1
      "activityStructureLength" => "CardActivityLengthRange", # 2
      "noOfCardVehicleRecords"  => "NoOfCardVehicleRecords",  # 2
      "noOfCardPlaceRecords"    => "NoOfCardPlaceRecords"     # 1
    }
  end

  def initialize
    super(10)
  end

  def read(file)
    read_sequence(file)
  end
end
