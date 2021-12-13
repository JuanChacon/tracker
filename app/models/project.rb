class Project < ActiveRecord::Base
    include ValidateName
    include BooleanToInt
end
