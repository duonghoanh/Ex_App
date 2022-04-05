class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token

  before_create :create_activation_digest

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_MIN_LENGTH = 6
  validates :email, presence: true,
                    length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX }
  # validates :email, uniqueness: { case_sensitive: false }
  validates :name, presence: true,
                   length: { maximum: 50 }
  validates :password, presence: true,
                       length: { minimum: PASSWORD_MIN_LENGTH },
                       allow_nil: true

  # self.table_attributes.map do |attribute|
  #   define_method('find_by_' + attribute.to_s, value) do
  #     self.find_by(attribute => value)
  #   end
  # end

  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    puts self.remember_token
    self.update_attribute(:remember_digest, User.digest(self.remember_token))
  end

  def forget
    self.update_attribute(:remember_digest, nil)
  end

  def authenticate?(attribute, token)
    digest = self.send(attribute)
    return false if digest.nil?
  
    BCrypt::Password.new(digest).is_password?(token)
  end
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  private

    def create_activation_digest
      self.activation_token = User.new_token
      
      self.activation_digest = User.digest(activation_token)
    end
end




# def edit_account_activation_path(id:, **options =  {email: 'vinh@gmail.comæ', age: 20})
#   link = "/account_activations/q5lt38hQDc_959PVoo6b7A/edit"
#   url_opt = []
#   options.each |key, value|
#     params_str = [key, CGI.escape(value)].join("=") # => 'email=vinh%40gmail.comæ'
#     url_opt << params_str #  => ['email=vinh%40gmail.comæ']
#     url_opt << params_str #  => ['email=vinh%40gmail.comæ', 'age=20']
#   end
#   url_opt_str = url_opt.join('&') # 'email=vinh%40gmail.comæ&age=20'
#   [link,url_opt_str].join('?') # => "/account_activations/q5lt38hQDc_959PVoo6b7A/edit?email=vinh%40gmail.comæ&age=20"
# end