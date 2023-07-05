class User < ApplicationRecord

    
    has_secure_password

    validates :password, length: { minimum: 8 }
    validates :username, uniqueness: true, length: {maximum: 20 }
    validates :email, email: true, uniqueness: true

    has_many :user_projects
    has_many :projects, through: :user_projects

    before_save :downcase_email

    def downcase_email
        self.email = email.downcase
    end
end
