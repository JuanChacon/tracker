module Tasks
    class Services < Base
        resource :tasks do
            desc 'Return all tasks'
            get '/'  do
                all_projects = Task.all
                projects_count = all_projects.count
                {items: all_projects,
                count: projects_count,
                total:projects_count}
                  
            end

            desc 'Create Task with allowed params' do
                failure [[401, 'Unauthorized', 'Entities::Error']]
            end
            params do
                requires :name, type: String, desc: 'name of the task to create'
            end
            
            post '/create' do 
                task = Task.new(declared(params))
                saved = task.save
                 response = {
                     errors: task.errors
                 }
 
                 if saved
                     response[:name]  = task.name
                     response[:id]  = task.id
                 end    
                 response
             end

            desc 'Assign Task with project'
            params do
                requires :taskId, as: :task_id, type: Integer, desc: 'Task ID.'
                requires :projectId, as: :project_id, type: Integer, desc: 'Project ID.'
            end

            post '/assign' do 
                task = Task.find(declared(params)[:task_id])
                updated = task.update(project_id:declared(params)[:project_id])

                response = {
                    errors: task.errors,
                    task: task
                }

            end

        end
    end
end