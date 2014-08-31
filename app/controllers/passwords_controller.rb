class PasswordsController < ApplicationController
  def edit
    @user = User.find_by_code(params[:id])
  end

  def create
    user = User.find_by_email(params[:email])

    if user
      user.set_password_reset
      UserMailer.password_reset(user).deliver
    end
    redirect_to '/', notice: "Email was sent with instructions"
  end

  def update
    @user = User.find(params[:id])

    if @user
      update_password = params.require(:user).permit(:password, :password_confirmation)
      @user.update_attributes(update_password)
      if @user.save
        redirect_to '/'
      else
        redirect_to '/edit'
      end
    end
  end
end
