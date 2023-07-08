class UserProjectSerializer < ActiveModel::Serializer
  attributes :id, :completed_status
  belongs_to :project, serializer: UserProjectWithCategorySerializer

  
end
