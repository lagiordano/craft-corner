class Category < ApplicationRecord
    validates :category_type, inclusion: { in: ["fabric", "yarn", "art", "home", "kids"] }

    has_many :projects
    has_many :user_projects, through: :projects
end
