module Fog
  module Compute
    class Brkt
      class Real
        def delete_volume_attachment(id)
          request(
            :expects => [200],
            :method  => "DELETE",
            :path    => "v1/api/config/brktvolumeattachment/#{id}"
          )
        end
      end

      class Mock
        def delete_volume_attachment(id)
          response = Excon::Response.new
          self.data[:volume_attachments].delete(id)
          response
        end
      end
    end
  end
end
