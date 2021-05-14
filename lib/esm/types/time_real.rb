require "esm/types/base"

class Esm::Types::TimeReal < Esm::Types::Base
  def initialize
    super(4)
  end

  def read(file)
    Time.at(file.read(length).unpack("N").first).utc
  end
end
