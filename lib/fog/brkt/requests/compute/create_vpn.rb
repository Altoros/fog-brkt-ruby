module Fog
  module Compute
    class Brkt
      class Real
        def create_vpn(computing_cell_id, options={})
          request(
            :expects => [201],
            :method  => "POST",
            :path    => "v1/api/config/computingcell/#{computing_cell_id}/vpns",
            :body    => Fog::JSON.encode(options)
          )
        end
      end

      class Mock
        def create_vpn(computing_cell_id, options={})
          response = Excon::Response.new
          id = Fog::Brkt::Mock.id
          data = {
            "id"                  => id,
            "customer"            => customer.id,
            "modified_by"         => "admin@brkt.com",
            "name"                => options[:name],
            "description"         => options[:description] || "",
            "vpn_type"            => options[:vpn_type] || "nat",
            "default_route"       => options[:default_route] || false,
            "requested_state"     => "AVAILABLE",
            "created_by"          => "admin@brkt.com",
            "instance"            => "51ae229209434e9881bc00be70b4d054",
            "modified_time"       => "2015-12-04T11:11:28.811269+00:00",
            "created_time"        => "2015-12-04T11:11:28.811236+00:00",
            "internet_ip_address" => "10.0.0.1",
            "computing_cell"      => computing_cell_id,
            "metadata"            => {}
          }
          self.data[:vpns][id] = data
          response.body = data
          response
        end
      end
    end
  end
end
