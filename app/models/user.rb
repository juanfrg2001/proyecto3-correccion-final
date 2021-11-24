class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :calories
  has_many :weights
  attr_accessor :remember_token, :activation_token, :share_token

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def create_token_digest
    self.share_token = User.new_token
    update_attribute(:token_digest,  User.digest(share_token))
    update_attribute(:token_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_token_email
    UserMailer.token_share(self).deliver_now
  end

end
