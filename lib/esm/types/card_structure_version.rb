require "esm/types/base"

class Esm::Types::CardStructureVersion < Esm::Types::OctetString
  def initialize
    super(2)
  end
end
