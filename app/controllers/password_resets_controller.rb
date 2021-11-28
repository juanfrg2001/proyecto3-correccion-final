class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user = current_user.create_reset_digest
    @user = current_user.send_password_reset_email
    flash[:info] = "Email sent with password reset instructions"
    redirect_to root_url
  end

  def edit
    @calories = Calory.where(user_id: current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  # Before filters




end

