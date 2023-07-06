class UserProjectWithCategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url, :image, :adds, :category

  def category
    {id: self.object.category.id, category_type: self.object.category.category_type }
  end

end
