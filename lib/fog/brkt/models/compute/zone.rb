require "fog/core/model"

module Fog
  module Compute
    class Brkt
      class Zone < Fog::Model
        identity :id

        attribute :cidr_block
        attribute :name
        attribute :provider_zone
        attribute :network,           :aliases => [:network_id, "network_id"]
        attribute :use_main_route_table, :type => :boolean

        def save
          requires :network, :name, :cidr_block

          data = service.create_zone(associations[:network], cidr_block, name).body
          merge_attributes(data)
          true
        end

        def destroy
          requires :id

          service.delete_zone(id)
          true
        end

        alias_method :use_main_route_table?, :use_main_route_table
      end
    end
  end
end
