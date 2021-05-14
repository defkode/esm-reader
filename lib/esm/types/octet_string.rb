require "esm/types/base"

class Esm::Types::OctetString < Esm::Types::Base
  def read(file)
    file.read(length).bytes.map { |v| sprintf("%02X", v) }.join
  end
end
