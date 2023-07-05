class UserProjectSerializer < ActiveModel::Serializer
  attributes :id, :completed_status, :category

  belongs_to :project

  def category
    cat = self.object.project.category
    category = {id: cat.id, category_type: cat.category_type }
    category
  end
end
