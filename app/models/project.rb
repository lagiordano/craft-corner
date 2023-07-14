class Project < ApplicationRecord
    validates :image, presence: true
    validates :title, presence: true, length: { in: 4..150 }
    validates :url, presence: true, uniqueness: true
    validates :description, presence: true, length: { in: 10..600 }
    validates :adds, numericality: { greater_than_or_equal_to: 0 }
    validates :category, inclusion: { in: ["fabric", "yarn", "art", "home", "kids"] }
    # validate :shared_by_username

    has_many :user_projects, dependent: :destroy
    has_many :users, through: :user_projects

    # def shared_by_username
    #     if session[:]
    #     unless shared_by == @current_user.username
    #         errors.add(:shared_by, "'Shared By' must be the username of the current user" )
    #     end
    # end

end
