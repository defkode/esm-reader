require "esm/types/base"

class Esm::Types::CardNumber < Esm::Types::Base
  def initialize
    super(16)
  end

  def read(file)
    file.read(length)
  end
end
