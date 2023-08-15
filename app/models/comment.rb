class Comment < ApplicationRecord

    validates :comment_text, presence: true, length: {in: 2..750}
    
    belongs_to :user
    belongs_to :project

end