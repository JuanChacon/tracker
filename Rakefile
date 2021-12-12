# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

desc "Print out routes"
task :routes => :environment do
    Helpers::Base.routes.each do |route|
    info = route.instance_variable_get :@options
    description = "%-40s..." % info[:description]
    method = "%-7s" % info[:method]
    p "#{description}  #{method}#{info[:path]}"
  end
end

Rails.application.load_tasks
