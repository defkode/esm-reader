require "esm/types/base"

# 2.19 CardIccIdentification
# Information, stored in a card, related to the identification of the integrated circuit (IC) card (requirement 192).
class Esm::Types::CardIccIdentification < Esm::Types::Base
  def sequence
    {
      "clockStop"                                => "OctetString^1",        # 1
      "cardExtendedSerialNumber"                 => "ExtendedSerialNumber", # 8
      "cardApprovalNumber"                       => "CardApprovalNumber",   # 8
      "cardPersonaliserID"                       => "OctetString^1",        # 1
      "embedderIcAssemblerId"                    => "OctetString^5",        # 5
      "icIdentifier"                             => "OctetString^2"         # 2
    }
  end

  def initialize
    super(25)
  end

  def read(file)
    read_sequence(file)
  end
end
