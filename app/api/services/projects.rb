module Projects
    class Services < Base
        # format 'json'
        # include Defaults

        resource :projects do

            
            desc "Return all projects"
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
                requires :id, type: Integer, desc: "Id of the project"
            end
            get '/:id' do 
                Project.find(params[:id])
            end

            desc 'Create project with params'
            params do
                requires :name, type: String, desc: "name of the project"
            end



            post '/create' do 
               project = Project.new(declared(params))
               saved = project.save
                response = {
                    persisted:project.persisted?,
                    errors: project.errors
                }

                response[:project]  = project if saved
                response
            end

           

         
        end

    end
end
