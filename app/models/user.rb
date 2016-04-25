class User < ActiveRecord::Base
    before_save { self.email = self.email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VAILD_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255 },
                      format: { with: VAILD_EMAIL_REGEX },
                      uniqueness: { case_sensetive: false }
    validates :area, length: { maximum: 50 }
    has_secure_password
end
