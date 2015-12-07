require "fog/core/model"

module Fog
  module Compute
    class Brkt
      class Vpn < Fog::Model
        module Type
          NAT     = "nat"
          OPENVPN = "openvpn"
          VPNHUB  = "vpnhub"
        end

        # @!group Attributes
        identity :id

        attribute :name
        attribute :description
        attribute :vpn_type
        attribute :default_route, :type => :boolean
        attribute :internet_ip_address
        attribute :requested_state
        attribute :instance
        attribute :computing_cell
        attribute :metadata
        # @!endgroup

        # Create VPN
        # Required attributes: *computing_cell*, *name*, *vpn_type*
        #
        # @return [true]
        def save
          if persisted?
            requires :id
          else
            requires :computing_cell, :name, :vpn_type

            merge_attributes(service.create_vpn(computing_cell, attributes).body)
          end
        end

        # Delete VPN
        #
        # @return [true]
        def destroy
          requires :id

          service.delete_vpn(id)
          true
        end
      end
    end
  end
end
