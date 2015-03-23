require "fog/core/collection"
require "fog/brkt/models/compute/zone"

module Fog
  module Compute
    class Brkt
      class Zones < Fog::Collection
        model Fog::Compute::Brkt::Zone

        attr_accessor :network

        def all
          if network.nil?
            load(service.list_zones.body)
          else
            load(service.list_network_zones(network.id).body)
          end
        end
      end
    end
  end
end
