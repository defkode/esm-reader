require "esm/types/base"

<<-TEXT
CardChipIdentification ::= SEQUENCE {
  icSerialNumber OCTET STRING (SIZE(4)),
  icManufacturingReferences OCTET STRING (SIZE(4))
}
TEXT

# 2.9 CardChipIdentification
# Information, stored in a card, related to the identification of the card’s Integrated Circuit (IC) (requirement 191).
class Esm::Types::CardChipIdentification < Esm::Types::Base
  def sequence
    {
      "icSerialNumber"             => "OctetString^4", # icSerialNumber is the IC serial number as defined in EN 726-3.
      "icManufacturingReferences"  => "OctetString^4"  # icManufacturingReferences is the IC manufacturer identifier and fabrication elements as defined in EN 726-3.
    }
  end

  def initialize
    super(8)
  end

  def read(file)
    read_sequence(file)
  end
end
