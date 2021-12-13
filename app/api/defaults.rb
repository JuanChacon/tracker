
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
        #logger class to use to log variables or methods
        def logger
          Rails.logger
        end


        def set_custom_task_properties(tasks)
          tasks.map do |task|
            {id: task.id,
             name: task.name,
            elapsed_time: task.elapsed_time,
            running: task.boolean_to_int('running'),
            start_time: task.start_time,
            deleted: task.boolean_to_int("deleted"),
            project_id: task.project_id
            }
          end
        end
        
        
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        error_response(message: e.message, status: 404)
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        error_response(message: e.message, status: 422)
      end

    end
  end