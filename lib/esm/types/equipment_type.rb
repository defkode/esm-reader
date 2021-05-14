require "esm/types/base"

class Esm::Types::EquipmentType < Esm::Types::Base
  def initialize
    super(1)
  end

  def read(file)
    et = file.read(length).bytes.first

    case et
    when 0 then "Reserved"
    when 1 then "Driver Card"
    when 2 then "Workshop Card"
    when 3 then "Control Card"
    when 4 then "Company Card"
    when 5 then "Manufacturing Card"
    when 6 then "Vehicle Unit"
    when 7 then "Motion Sensor"
    when 8..255 then "RFU"
    end
  end
end
