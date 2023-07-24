class Project < ApplicationRecord
    # validates :image, presence: true
    validates :title, presence: true, length: { in: 4..150 }
    validates :description, presence: true
    validates :adds, numericality: { greater_than_or_equal_to: 0 }
    validates :category, inclusion: { in: ["fabric", "yarn", "art", "home", "kids"] }
   

    has_many :user_projects, dependent: :destroy
    has_many :users, through: :user_projects

   

end
