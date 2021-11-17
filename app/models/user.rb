class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :reset_token

  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest: FILL_IN, reset_sent_at: FILL_IN)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end


end
