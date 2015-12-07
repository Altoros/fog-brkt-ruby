require "fog/core/collection"
require "fog/brkt/models/compute/vpn"

module Fog
  module Compute
    class Brkt
      class Vpns < Fog::Collection
        model Fog::Compute::Brkt::Vpn

        # @return [ComputingCell] computing cell
        attr_accessor :computing_cell

        # Get VPNs
        # Requires {#computing_cell} attribute to be set.
        #
        # @return [Array<Vpn>] VPNs
        def all
          requires :computing_cell
          load(service.list_vpns(computing_cell.id).body)
        end
      end
    end
  end
end
