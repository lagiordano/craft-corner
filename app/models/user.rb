class User < ApplicationRecord
    validates :username, :email, :first_name, :last_name, :password_digest, presence: true

    has_many :user_projects
    has_many :projects, through: :user_projects
end
