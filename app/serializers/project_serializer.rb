class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url, :image, :adds, :category, :shared_by, :added_or_updated_at

  def added_or_updated_at
    self.object.updated_at.strftime("%d/%m/%Y")
  end


end


