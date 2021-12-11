
module Defaults extend ActiveSupport::Concern
    included do
      helpers do
        #get the actual user from token
        def current_user
          resource_owner #helper provider by wine-bouncer gem
        end

        # helper method to valid the token life of user
        def authenticate!
          error!('401 Unauthorized', 401) unless current_user
        end
      end

    end
  end