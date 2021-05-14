require "esm/types/base"

class Esm::Types::ExtendedSerialNumber < Esm::Types::Base
  def sequence
    {
      "serialNumber"     => "Integer^4",        # 4
      "monthYear"        => "BCDString^2",      # 2
      "type"             => "OctetString^1",    # 1
      "manufacturerCode" => "ManufacturerCode", # 1
    }
  end

  def initialize
    super(8)
  end

  def read(file)
    read_sequence(file)
  end
end
