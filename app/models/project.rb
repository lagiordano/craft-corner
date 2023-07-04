class Project < ApplicationRecord
    validates :title, :url, :image, presence: true
    validates :description, length: { maximum: 300 }
    validates :adds, numericality: { greater_than_or_equal_to: 0 }

    belongs_to :category
    has_many :user_projects
    has_many :users, through: :user_projects


end
