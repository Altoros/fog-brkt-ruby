module Fog
  module Compute
    class Brkt
      class Real
        def list_machine_types(filter = {})
          request(
            :expects => [200],
            :path    => "v1/api/config/machinetype",
            :query   => filter
          )
        end
      end

      class Mock
        def list_machine_types(filter = {})
          response = Excon::Response.new
          response.body = self.data[:machine_types].map do |id, machine_type_data|
            machine_type_data
          end
          response
        end
      end
    end
  end
end
