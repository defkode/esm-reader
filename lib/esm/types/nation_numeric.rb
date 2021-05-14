require "esm/types/base"

class Esm::Types::NationNumeric < Esm::Types::Base
  def initialize
    super(1)
  end

  def read(file)
    file.read(length).bytes.first
  end
end
