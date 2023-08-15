class Project < ApplicationRecord
    
    validates :title, presence: true, length: { in: 4..60 }
    validates :description, length: { maximum: 4000}
    validates :adds, numericality: { greater_than_or_equal_to: 0 }
    validates :category, inclusion: { in: ["fabric", "yarn", "art", "home", "kids"] }
    validates :url, uniqueness: true, if: :url
   

    has_many :user_projects, dependent: :destroy
    has_many :users, through: :user_projects
    has_many :comments, dependent: :destroy 
    

   

end
