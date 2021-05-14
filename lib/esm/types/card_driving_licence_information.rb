require "esm/types/base"

# 2.14 CardDrivingLicenceInformation
# Information, stored in a driver card, related to the card holder driver licence data (requirement 196).
class Esm::Types::CardDrivingLicenceInformation < Esm::Types::Base
  def sequence
    {
      "drivingLicenceIssuingAuthority"           => "Name",          # 36
      "drivingLicenceIssuingNation"              => "NationNumeric", # 1
      "drivingLicenceNumber"                     => "IA5String^16",  # 16
    }
  end

  def initialize
    super(53)
  end

  def read(file)
    read_sequence(file)
  end
end
