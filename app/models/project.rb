class Project < ApplicationRecord
    validates :image, presence: true
    validates :title, presence: true, length: { in: 4..150 }
    validates :url, presence: true, uniqueness: true
    validates :description, presence: true, length: { in: 10..600 }
    validates :adds, numericality: { greater_than_or_equal_to: 0 }

    belongs_to :category
    has_many :user_projects, dependent: :destroy
    has_many :users, through: :user_projects


end
