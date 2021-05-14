# primitives
require "esm/types/bcd_string"
require "esm/types/ia5_string"
require "esm/types/octet_string"

require "esm/types/integer"
require "esm/types/time_real"

require "esm/types/signature"
require "esm/types/certificate"
require "esm/types/name"
require "esm/types/nation_numeric"
require "esm/types/card_number"
require "esm/types/card_approval_number"
require "esm/types/equipment_type"
require "esm/types/event_fault_type"
require "esm/types/manufacturer_code"
require "esm/types/card_activity_length_range"
require "esm/types/no_of_card_place_records"
require "esm/types/no_of_card_vehicle_records"
require "esm/types/no_of_events_per_type"
require "esm/types/no_of_faults_per_type"

require "esm/types/driver_card_application_identification"
require "esm/types/card_icc_identification"
require "esm/types/extended_serial_number"
require "esm/types/card_chip_identification"
require "esm/types/card_event_record"
require "esm/types/card_structure_version"
require "esm/types/card_driving_licence_information"
require "esm/types/vehicle_registration_identification"
require "esm/types/vehicle_registration_number"

module Esm
  class File
     TLV = {
      [0x00, 0x02, 0x00] => { id: "ICC", byterange: (25..25) },
      [0x00, 0x05, 0x00] => { id: "IC",  byterange: (8..8) },
      [0xC1, 0x00, 0x00] => { id: "CardCertificate", byterange: (194..194) },
      [0xC1, 0x08, 0x00] => { id: "CACertificate", byterange: (194..194) },

      [0x05, 0x01, 0x00] => { id: "ApplicationIdentification", byterange: (10..10) },
      [0x05, 0x01, 0x01] => { id: "ApplicationIdentificationSignature", byterange: (128..128) },

      [0x05, 0x20, 0x00] => { id: "Identification", byterange: (143..143) },
      [0x05, 0x20, 0x01] => { id: "IdentificationSignature", byterange: (128..128) },

      [0x05, 0x0E, 0x00] => { id: "CardDownload", byterange: (4..4) },
      [0x05, 0x0E, 0x01] => { id: "CardDownloadSignature", byterange: (128..128) },

      [0x05, 0x21, 0x00] => { id: "DrivingLicenceInfo", byterange: (53..53)  },
      [0x05, 0x21, 0x01] => { id: "DrivingLicenceInfoSignature", byterange: (128..128) },

      [0x05, 0x02, 0x00] => { id: "EventsData", byterange: (864..1728) },
      [0x05, 0x02, 0x01] => { id: "EventsDataSignature", byterange: (128..128) },

      [0x05, 0x03, 0x00] => { id: "FaultsData", byterange: (576..1152) },
      [0x05, 0x03, 0x01] => { id: "FaultsDataSignature", byterange: (128..128) },

      [0x05, 0x04, 0x00] => { id: "DriverActivityData", byterange: (5548..13780) },
      [0x05, 0x04, 0x01] => { id: "DriverActivityDataSignature", byterange: (128..128) },

      [0x05, 0x05, 0x00] => { id: "VehiclesUsed", byterange: (2606..6202) },
      [0x05, 0x05, 0x01] => { id: "VehiclesUsedSignature", byterange: (128..128) },

      [0x05, 0x06, 0x00] => { id: "Places", byterange: (841..1121) },
      [0x05, 0x06, 0x01] => { id: "PlacesSignature", byterange: (128..128) },

      [0x05, 0x07, 0x00] => { id: "CurrentUsage", byterange: (19..19) },
      [0x05, 0x07, 0x01] => { id: "CurrentUsageSignature", byterange: (128..128) },

      [0x05, 0x08, 0x00] => { id: "ControlActivityData", byterange: (46..46) },
      [0x05, 0x08, 0x01] => { id: "ControlActivityDataSignature", byterange: (128..128) },

      [0x05, 0x22, 0x00] => { id: "SpecificConditions", byterange: (280..280) },
      [0x05, 0x22, 0x01] => { id: "SpecificConditionsSignature", byterange: (128..128) }
    }


    # DriverCard Specification p.139-140
    SEQUENCES = {
      "ICC" => {
        "CardIccIdentification"   => "CardIccIdentification"  # 25
      },
      "IC" => {
        "CardChipIdentification"  => "CardChipIdentification" # 8
      },
      "CardCertificate" => {
        "CardCertificate"         => "Certificate"
      },
      "CACertificate" => {
        "MemberStateCertificate" => "Certificate"
      },
      "ApplicationIdentification" => {
        "DriverCardApplicationIdentification"                            => "DriverCardApplicationIdentification"
      },
      "ApplicationIdentificationSignature" => {
        "signature"                                                      => "Signature"
      },

      "Identification" => {
        "CardIdentification.CardIssuingMemberState"                      => "NationNumeric", # 1
        "CardIdentification.CardNumber"                                  => "CardNumber", # 16
        "CardIdentification.CardIssuingAuthorityName"                    => "Name", # 36
        "CardIdentification.CardIssueDate"                               => "TimeReal", # 4
        "CardIdentification.CardValidityBegin"                           => "TimeReal", # 4
        "CardIdentification.CardExpiryDate"                              => "TimeReal", # 4

        "DriverCardHolderIdentification.CardHolderName.HolderSurname"    => "Name", # 36
        "DriverCardHolderIdentification.CardHolderName.HolderFirstNames" => "Name", # 36
        "DriverCardHolderIdentification.CardHolderBirthDate"             => "TimeReal", # 4
        "DriverCardHolderIdentification.CardHolderPreferredLanguage"     => "IA5String^2" # 2
      },
      "IdentificationSignature" => {
        "signature"                                                      => "Signature"
      },

      "CardDownload" => {
        "LastCardDownload"                                               => "TimeReal"
      },
      "CardDownloadSignature" => {
        "signature"                                                      => "Signature"
      },

      "DrivingLicenceInfo" => {
        "CardDrivingLicenceInformation"                                 => "CardDrivingLicenceInformation"
      },
      "DrivingLicenceInfoSignature" => {
        "signature"                                                      => "Signature"
      },

      "EventsData" => {
      },
      "EventsDataSignature" => {
        "signature"                                                      => "Signature"
      },

      "FaultsData" => {},
      "FaultsDataSignature" => {
        "signature"                                                      => "Signature"
      },

      "DriverActivityData" => {},
      "DriverActivityDataSignature" => {
        "signature"                                                      => "Signature"
      },

      "VehiclesUsed" => {},
      "VehiclesUsedSignature" => {
        "signature"                                                      => "Signature"
      },

      "Places" => {},
      "PlacesSignature" => {
        "signature"                                                      => "Signature"
      },

      "CurrentUsage" => {},
      "CurrentUsageSignature" => {
        "signature"                                                      => "Signature"
      },

      "ControlActivityData" => {},
      "ControlActivityDataSignature" => {
        "signature"                                                      => "Signature"
      },

      "SpecificConditions" => {},
      "SpecificConditionsSignature" => {
        "signature"                                                      => "Signature"
      }
    }

    attr_reader :blocks

    def initialize(file)
      @file = file

      raise ArgumentError unless @file.is_a?(IO)

      @blocks = {}
      scan_file
    end

    def to_hash
      return @to_hash if defined?(@to_hash)
      @to_hash = @blocks.inject({}) do |memo, (block_id, options)|
        memo[block_id] = read_block(block_id)
        memo
      end
    end

    def read_block(block_id)
      block = @blocks[block_id]

      @file.seek(block[:pos])

      SEQUENCES[block_id]&.inject({}) do |memo, (key, definition)|
        type, length = definition.split("^")

        if length
          reader = "Esm::Types::#{type}".constantize.new(length.to_i)
        else
          reader = "Esm::Types::#{type}".constantize.new
        end

        memo[key] = reader.read(@file)
        memo
      end
    end

    private

    def scan_file
      @file.rewind # ensure pos 0

      until @file.eof?
        # block 5-byte header
        block_tag    = @file.read(3).bytes
        block_length = @file.read(2).unpack("n2").first # block_length must be within byterange

        block_id = TLV[block_tag][:id]

        @blocks[block_id] = { pos: @file.pos, length: block_length }
        @file.pos += block_length # @file.read(block_length)
      end

      ap @blocks
    end
  end
end
