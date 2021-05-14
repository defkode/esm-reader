require "esm/types/base"

class Esm::Types::EventFaultType < Esm::Types::OctetString
  def initialize
    super(1)
  end
end
