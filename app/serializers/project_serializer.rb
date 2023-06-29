class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url, :image, :likes

  belongs_to :category
end
