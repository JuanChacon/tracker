module Projects
    class Services < Grape::API
        format 'json'
        include Defaults

        resource :projects do
            desc 'Return all projects'
            # Validate token helper 
            # oauth2 
            #pagination helper
            paginate per_page: 3, max_per_page: 5

            get '/' do
            all_projects = paginate(Project.all.select(:id,:name,:deleted)) 
            
            projects_count = all_projects.count
            {items: all_projects,
             count: projects_count,
             total:projects_count}
              
            end


            desc 'Create project with allowed params'
            params do
                requires :name, type: String, desc: 'name of the project to create'
            end
            post '/create' do 
               project = Project.create(declared(params))

            end

            desc 'Delete a project object as logic delete, that means put the deleted property as true'
            params do 
               requires :id, type: Integer, desc: "Id of the project"
            end
            route_param :id do
                post '/delete' do 
                    project = Project.find(params[:id])
                    updated = project.update(deleted: 1)
                    
                    response = {}
                    if updated
                        response[:name]  = project.name
                        response[:id]  = project.id
                        response[:deleted]  = project.deleted
                    else
                        response[:errors]= project.errors 
                    end
                    response
    
                end 
            end

            desc 'Get all projects where taskId is equal to key'
            params do 
               requires :projectId, as: :id, type: Integer, desc: "Id of the project"
            end
            route_param :projectId do 
                get 'report' do
                    tasks_by_project = Task.where(project_id:params[:id])
                    total_time = tasks_by_project.pluck(:elapsed_time).compact.inject(0, :+)
                    tasks_by_project = tasks_by_project.map do |task|
                        {id: task.id,
                         name: task.name,
                        elapsed_time: task.elapsed_time,
                        running: task.boolean_to_int('running'),
                        start_time: task.start_time,
                        deleted: task.boolean_to_int("deleted"),
                        project_id: task.project_id
                        }
                    end
                    {
                        tasks: tasks_by_project,
                        total_time:total_time
                    }
                end
            end
        end

    end
end
