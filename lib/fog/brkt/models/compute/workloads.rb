require "fog/core/collection"
require "fog/brkt/models/compute/workload"

module Fog
  module Compute
    class Brkt
      class Workloads < Fog::Collection
        model Fog::Compute::Brkt::Workload

        def all
          load(service.list_workloads.body)
        end

        def get(id)
          new(service.get_workload(id).body)
        end
      end
    end
  end
end
