class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, length: { in: 4..20 }
    validates :email, presence: true, email: true, uniqueness: true
    

    has_secure_password
    validates :password, length: { minimum: 8 }, format: { with: /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/x, message: "must include at least 1 digit, 1 uppercase letter, and 1 lowercase letter" }
    
    validates :username, presence: true, uniqueness: true, length: { in: 4..20 }
    validates :email, presence: true, email: true, uniqueness: true

    has_many :user_projects, dependent: :destroy
    has_many :projects, through: :user_projects

    # Move responsibility of this to front end once built
    before_save :downcase_email
    def downcase_email
        self.email = email.downcase
    end


end
