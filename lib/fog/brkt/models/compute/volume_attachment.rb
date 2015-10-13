require "fog/core/model"

module Fog
  module Compute
    class Brkt
      class VolumeAttachment < Fog::Model
        module RequestedState
          AVAILABLE = 'AVAILABLE'
          STOPPED = 'STOPPED'
          UNAVAILABLE = 'UNAVAILABLE'
          DELETED = 'DELETED'
        end

        module State
          READY = 'READY'
        end

        # @!group Attributes
        identity :id

        attribute :name
        attribute :description
        attribute :instance,                    :aliases => ["instance_id", :instance_id]
        attribute :bracket_volume,              :aliases => ["bracket_volume_id", :bracket_volume_id]
        attribute :attach_point
        attribute :requested_state
        attribute :state

        # @!endgroup

        # Create a volume attachment.
        # Required attributes for create: {#name}, {#instance}, {#bracket_volume}
        #
        # @return [true]
        def save
          if persisted?
            false
          else
            requires :name, :instance, :bracket_volume
            data = service.create_volume_attachment(attributes).body
            merge_attributes(data)
            true
          end
        end

        # Delete volume attachment.
        #
        # @return [true]
        def destroy
          requires :id
          service.delete_volume_attachment(id)
          true
        end

        def ready?
          state == READY
        end
      end
    end
  end
end
