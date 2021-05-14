require "esm/types/base"
require "bcd"

class Esm::Types::BCDString < Esm::Types::Base
  def read(file)
    # 8421 encoding
    file.read(length).bytes.map do |b|
      BCD.decode(b)
    end
  end
end
