class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url, :image, :adds

  belongs_to :category
  
end


