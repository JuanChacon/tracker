class Task < ActiveRecord::Base
    include ValidateName
    include BooleanToInt
    belongs_to :project

    #validations
   
end
