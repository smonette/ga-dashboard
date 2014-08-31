class UsersController < ApplicationController
  def index

  end
  def new
    # @user = User.new
  end
  def create
    new_user = params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :image_url)
    @user = User.new(new_user)

    if @user.save
      flash[:new_user] = "Message"
      session[:id] = @user.id
      @current_user = User.find_by_id(@user.id)
      redirect_to '/'
    else
      if @user.password != @user.password_confirmation
        flash[:password_error] = "Message"
      end
      redirect_to "/"
    end
  end
  def show

  end
  def edit

  end
  def update

  end
  def destroy

  end
end
