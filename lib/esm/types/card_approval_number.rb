require "esm/types/base"

class Esm::Types::CardApprovalNumber < Esm::Types::IA5String
  def initialize
    super(8)
  end

  def read(file)
    file.read(length)
  end
end
