require "esm/types/base"

class Esm::Types::Signature < Esm::Types::OctetString
  def initialize
    super(128)
  end
end
