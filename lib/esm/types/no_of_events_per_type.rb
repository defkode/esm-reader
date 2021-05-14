require "esm/types/base"

class Esm::Types::NoOfEventsPerType < Esm::Types::Integer
  def initialize
    super(1)
  end
end
