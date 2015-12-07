module Fog
  module Compute
    class Brkt
      class Real
        def delete_vpn(id)
          request(
            :expects => [200],
            :method  => "DELETE",
            :path    => "v1/api/config/vpn/#{id}"
          )
        end
      end

      class Mock
        def delete_vpn(id)
          response = Excon::Response.new
          self.data[:vpns].delete(id)
          response
        end
      end
    end
  end
end
