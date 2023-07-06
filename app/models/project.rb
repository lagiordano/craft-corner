class Project < ApplicationRecord
    validates :title, :image, presence: true
    validates :url, presence: true, uniqueness: true
    validates :description, length: { maximum: 300 }
    validates :adds, numericality: { greater_than_or_equal_to: 0 }

    belongs_to :category
    has_many :user_projects, dependent: :destroy
    has_many :users, through: :user_projects


end
