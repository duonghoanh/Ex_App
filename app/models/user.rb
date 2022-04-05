class User < ApplicationRecord
    has_secure_password
    before_save :downcase_email
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                      length: { maximum: 100 },
                      format: { with: VALID_EMAIL_REGEX }
    validates :name, presence: true
  
    private
    def downcase_email
      self.email.downcase!
    end
end
