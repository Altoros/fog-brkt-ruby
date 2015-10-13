require "fog/core/collection"
require "fog/brkt/models/compute/volume_attachment"

module Fog
  module Compute
    class Brkt
      class VolumeAttachments < Fog::Collection
        model Fog::Compute::Brkt::VolumeAttachment

        # @return [Server]
        attr_accessor :instance

        # @return [Volume]
        attr_accessor :bracket_volume

        # Get volume attachments
        #
        # @return [Array<VolumeAttachment>] Volume attachments
        def all(filter = {})
          filter[:instance] = instance unless instance.nil?
          filter[:bracket_volume] = bracket_volume unless bracket_volume.nil?
          load(service.list_volume_attachments(filter).body)
        end

        # Get Volume attachment by ID
        #
        # @param [String] id Volume attachment id
        # @return [VolumeAttachment,nil] Volume attachment if found, nil otherwise
        def get(id)
          begin
            new(service.get_volume_attachment(id).body)
          rescue Excon::Errors::NotFound
            nil
          end
        end
      end
    end
  end
end
