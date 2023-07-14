class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url, :image, :adds, :category, :shared_by


end


