class User < ApplicationRecord


    has_secure_password
    validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/x, message: "must include at least 1 digit, 1 uppercase letter, and 1 lowercase letter" }, on: :create
    
    validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
    validates :email, presence: true, email: true, uniqueness: true

    has_many :user_projects, dependent: :destroy
    has_many :projects, through: :user_projects

   


end