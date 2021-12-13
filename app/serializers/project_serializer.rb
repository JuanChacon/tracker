class ProjectSerializer < ActiveModel::Serializer
  cache key: 'project', expires_in: 2.hours
  attributes :id, :name 
  attribute :errors, if: :errors?


  def errors?
    object.errors.any?
   end
end
