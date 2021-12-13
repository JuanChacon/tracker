module Tasks
    class Services < Grape::API
        format 'json'
        include Defaults
        
        resource :tasks do
            desc 'Return all tasks'
            paginate per_page: 3, max_per_page: 5
            get '/'  do
                
                tasks = paginate(Task.all)
                tasks_count = tasks.count
                {items: set_custom_task_properties(tasks),
                count: tasks_count,
                total:tasks_count}
                  
            end

            desc 'Create Task with allowed params' do
                failure [[401, 'Unauthorized']]
            end
            params do
                requires :name, type: String, desc: 'name of the task to create'
            end
            
            post '/create' do 
                task = Task.new(declared(params))
                saved = task.save
                 response = {}
 
                 if saved
                     response[:name] = task.name
                     response[:id] = task.id
                 else
                    response[:errors] = task.errors
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
                project = Project.find(declared(params)[:project_id])
                task.update(project_id:project.id)
                task
            end

            desc 'Delete a task object as logic delete, that means put the deleted property as true'
            params do 
               requires :id, type: Integer, desc: "Id of the project"
            end
            route_param :id do
                post '/delete' do 
                    task = Task.find(params[:id])
                    updated = task.update(deleted: 1)
                    task
    
                end 
            end

            desc 'Start task'
            params do
                requires :taskId, as: :id, type: Integer, desc: 'Task ID.'
            end

            route_param :taskId do
                post '/start' do
                    task = Task.find(params[:id])
                    unless task.running
                        task.start_time = DateTime.now.strftime('%Q').to_i
                        task.running = true
                        task.save
                    else
                        task.errors.add(:running, 'Is already running')
                    end
                    
                    task
                    
                end
            end

            desc 'Start task'
            params do
                requires :taskId, as: :id, type: Integer, desc: 'Task ID.'
            end

            route_param :taskId do
                post '/start' do
                    task = Task.find(params[:id])
                    unless task.running
                        task.start_time = DateTime.now.strftime('%Q').to_i
                        task.running = true
                        task.save
                    else
                        task.errors.add(:running, 'Is already running')
                    end
                    
                    task
                    
                end
            end

            desc 'Stop task'
            params do
                requires :taskId, as: :id, type: Integer, desc: 'Task ID.'
            end

            route_param :taskId do
                post '/stop' do 
                    task = Task.find(params[:id])
                    if task.running
                       task.running = false
                       task.save
                    else
                      task.errors.add(:running,'Its already stopped')
                    end
                    task
                end
            end

        end
    end
end