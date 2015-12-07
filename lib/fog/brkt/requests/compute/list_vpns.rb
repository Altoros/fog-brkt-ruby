module Fog
  module Compute
    class Brkt
      class Real
        def list_vpns(computing_cell_id)
          request(
            :expects => [200],
            :path    => "v1/api/config/computingcell/#{computing_cell_id}/vpns"
          )
        end
      end

      class Mock
        def list_vpns(computing_cell_id)
          response = Excon::Response.new
          data = self.data[:vpns].select do |id, vpn|
            vpn["computing_cell"] == computing_cell_id
          end.values
          response.body = data
          response
        end
      end
    end
  end
end
