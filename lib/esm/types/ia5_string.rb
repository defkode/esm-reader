require "esm/types/base"

class Esm::Types::IA5String < Esm::Types::Base
  def read(file)
    file.read(length)
  end
end
