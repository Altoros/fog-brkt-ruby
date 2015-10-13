require "fog/core/collection"
require "fog/brkt/models/compute/cloudinit"

module Fog
  module Compute
    class Brkt
      class Cloudinits < Fog::Collection
        model Fog::Compute::Brkt::Cloudinit

        # Get cloud inits
        #
        # @return [Array<Cloudinit>] Cloud inits
        def all
          load(service.list_cloudinits.body)
        end

        # Get cloud init by ID
        #
        # @param [String] id Cloud init id
        # @return [Cloudinit,nil] Cloud init if found, nil otherwise
        def get(id)
          begin
            new(service.get_cloudinit(id).body)
          rescue Excon::Errors::NotFound
            nil
          end
        end
      end
    end
  end
end
