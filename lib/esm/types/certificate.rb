require "esm/types/base"

class Esm::Types::Certificate < Esm::Types::Base
  def sequence
    {
      "signature"                       => "Signature", # 128
      "publicKeyRemainder"              => "OctetString^58",  # 58
      "certificationAuthorityReference" => "OctetString^8"    # 8; https://dtc.jrc.ec.europa.eu/dtc_public_key_certificates_dt.php.html
    }
  end

  def initialize
    super(194)
  end

  def read(file)
    read_sequence(file)
  end
end
