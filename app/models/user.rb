class User < ApplicationRecord
    has_secure_password
    validates :password_digest, presence: true
    validates :email, :username, uniqueness: true

    has_many :user_projects
    has_many :projects, through: :user_projects
end
