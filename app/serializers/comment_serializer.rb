class CommentSerializer < ActiveModel::Serializer
    attributes :id, :comment_text, :username, :posted


    def posted 
        self.object.updated_at.strftime("%d/%m/%Y")
    end

    def username
        self.object.user.username
    end

  
end