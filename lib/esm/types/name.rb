require "esm/types/base"

class Esm::Types::Name < Esm::Types::Base
  def initialize
    super(36)
  end

  def read(file)
    rawdata = file.read(length)

    codepage = rawdata.unpack("U").first
    name = rawdata.byteslice(1, rawdata.bytes.count)
    name.encode("utf-8", "iso-8859-#{codepage}").strip
  end
end
