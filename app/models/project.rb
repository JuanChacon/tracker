class Project < ActiveRecord::Base


    #constraints for model
    validates_presence_of :name

end
