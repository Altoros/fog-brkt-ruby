module Fog
  module Compute
    class Brkt
      class Real
        def list_volume_attachments(filter = {})
          request(
            :expects => [200],
            :path    => "v1/api/config/brktvolumeattachment",
            :query   => filter
          )
        end
      end

      class Mock
        def list_volume_attachments(filter = {})
          response = Excon::Response.new
          response.body = self.data[:volume_attachments].values
          response
        end
      end
    end
  end
end
