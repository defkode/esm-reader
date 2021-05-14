require "esm/types/base"

class Esm::Types::NoOfFaultsPerType < Esm::Types::Integer
  def initialize
    super(1)
  end
end
