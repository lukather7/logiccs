module Fog
  module Compute
    class Terremark
      class Address < Fog::Model
        identity :id

        attribute :ip, :aliases => "name"

        def destroy
          requires :id
          service.delete_public_ip(id)
          true
        end

        private

        def href=(new_href)
          self.id = new_href.split("/").last.to_i
        end
      end
    end
  end
end
