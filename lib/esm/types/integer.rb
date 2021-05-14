require "esm/types/base"

class Esm::Types::Integer < Esm::Types::Base
  def read(file)
    case length
    when 1
      file.read(length).unpack("C").first # 8-bit unsigned (unsigned char)
    when 2
      file.read(length).unpack("n").first # 16-bit unsigned, network (big-endian) byte order
    when 4
      file.read(length).unpack("N").first # 32-bit unsigned, network (big-endian) byte order
    end
  end
end
