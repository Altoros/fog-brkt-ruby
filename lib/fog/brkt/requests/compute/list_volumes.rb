module Fog
  module Compute
    class Brkt
      class Real
        def list_volumes(filter = {})
          request(
            :expects => [200],
            :path    => "v1/api/config/brktvolume",
            :query   => filter
          )
        end
      end

      class Mock
        def list_volumes(filter = {})
          response = Excon::Response.new
          response.body = data[:volumes].map { |id, volume_data| volume_data }
          response
        end
      end
    end
  end
end
