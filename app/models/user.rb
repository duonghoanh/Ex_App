class User < ApplicationRecord
   
# validate : age<100
validates :min_age, numericality: { greater_than: 0, less_than_or_equal_to: :max_age }

validates :max_age, numericality: { less_than_or_equal_to: 100 }

has_secure_password
validates :password_digest, presence: true, length: { minimum: 6 }
end
