# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#fake data 

if Rails.env.development?
    5.times do 
        project = Project.new(name:Faker::Movies::StarWars.character)
        project.save
    end
    
    5.times do 
        project = Task.new(name:Faker::TvShows::Friends.character)
        project.save
    end
end