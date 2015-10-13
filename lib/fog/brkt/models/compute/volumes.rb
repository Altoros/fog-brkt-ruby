require "fog/core/collection"
require "fog/brkt/models/compute/volume"

module Fog
  module Compute
    class Brkt
      class Volumes < Fog::Collection
        model Fog::Compute::Brkt::Volume

        # Get volumes.
        #
        # @return [Array<Volume>] volumes
        def all(filter = {})
          load(service.list_volumes(filter).body)
        end

        # Get volume by ID
        #
        # @param [String] id volume id
        # @return [Volume,nil] volume if found, nil otherwise
        def get(id)
          begin
            new(service.get_volume(id).body)
          rescue Excon::Errors::NotFound
            nil
          end
        end
      end
    end
  end
end
