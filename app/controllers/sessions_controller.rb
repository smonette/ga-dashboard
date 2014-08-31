class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      redirect_to '/', notice: "you're logged in"
    else
      flash.now[:error] = "Something went wrong"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to '/', notice: "you're logged out"
  end
end
