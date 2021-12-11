class Task < ActiveRecord::Base
    include ValidateName
    belongs_to :project
end
