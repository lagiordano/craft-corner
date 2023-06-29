class CategorySerializer < ActiveModel::Serializer
  attributes :id, :category_type

  has_many :projects
end
