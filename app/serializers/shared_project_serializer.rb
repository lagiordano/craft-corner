class SharedProjectSerializer < ActiveModel::Serializer
  attributes :id, :project

  def project 
    project = {
      title: self.object.title,
      id: self.object.id,
      category: self.object.category,
      image: self.object.image,
      adds: self.object.adds,
      shared_by: self.object.shared_by
    }
    project
  end


end
