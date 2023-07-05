class ProjectsInCategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url, :image, :adds
end
