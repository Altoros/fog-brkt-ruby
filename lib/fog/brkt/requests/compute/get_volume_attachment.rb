module Fog
  module Compute
    class Brkt
      class Real
        def get_volume_attachment(id)
          request(
            :expects => [200],
            :path    => "v1/api/config/brktvolumeattachment/#{id}"
          )
        end
      end

      class Mock
        def get_volume_attachment(id)
          Excon::Response.new(:body => self.data[:volume_attachments][id])
        end
      end
    end
  end
end
