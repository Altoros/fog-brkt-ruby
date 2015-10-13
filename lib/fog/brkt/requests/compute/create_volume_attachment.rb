module Fog
  module Compute
    class Brkt
      class Real
        def create_volume_attachment(attributes = {})
          request(
            :expects => [201],
            :method  => "POST",
            :path    => "v1/api/config/brktvolumeattachment",
            :body    => Fog::JSON.encode(attributes)
          )
        end
      end

      class Mock
        def create_volume_attachment(attributes = {})
          response = Excon::Response.new
          id = Fog::Brkt::Mock.id
          data = {
            "id"              => id,
            "customer"        => customer.id,
            "name"            => 'Attachment',
            "bracket_volume"  => Fog::Brkt::Mock.id,
            "instance"        => Fog::Brkt::Mock.id,
            "description"     => "",
            "attach_point"    => "",
            "requested_state" => "AVAILABLE",
            "state"           => "READY",
            "created_by"      => "admin@brkt.com",
            "modified_by"     => "admin@brkt.com",
            "created_time"    => "2015-07-23T08:35:16.026185+00:00",
            "modified_time"   => "2015-07-23T08:35:16.026234+00:00",
          }.merge(attributes)
          self.data[:volume_attachments][id] = data
          response.body = data
          response
        end
      end
    end
  end
end
