module Projects
    class Services < Base

        resource :projects do

            
            desc 'Return all projects'
            # oauth2
            get '/'  do
            all_projects = Project.all
            projects_count = all_projects.count
            {items: all_projects,
            count: projects_count,
            total:projects_count}
              
            end

            desc ''
            params do
                requires :id, type: Integer, desc: 'Id of the project'
            end
            get '/:id' do 
                Project.find(params[:id])
            end

            desc 'Create project with allowed params'
            params do
                requires :name, type: String, desc: 'name of the project to create'
            end
            post '/create' do 
               project = Project.new(declared(params))
               saved = project.save
                response = {
                    errors: project.errors
                }

                if saved
                    response[:name]  = project.name
                    response[:id]  = project.id
                end    
                response
            end

            desc 'Delete a project object as logic delete, that means put the delete property as true'
            params do 
               requires :id, type: Integer, desc: "Id of the project"
            end
            route_param :id do
                post '/delete' do 
                    project = Project.find(params[:id])
                    updated = project.update(deleted: 1)
                    response = {
                        errors: project.errors
                    }
    
                    if updated
                        response[:name]  = project.name
                        response[:id]  = project.id
                        response[:deleted]  = project.deleted
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
                    {
                        tasks: tasks_by_project,
                        total_time:total_time
                    }
                end
            end

         
        end

    end
end
