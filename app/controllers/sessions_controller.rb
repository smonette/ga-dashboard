class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:id] = @user.id
      redirect_to '/', notice: "you're logged in"
    else
      flash.now[:error] = "Something went wrong"
      redirect_to '/'
    end
  end

  def destroy
    session[:id] = nil
    redirect_to '/', notice: "you're logged out"
  end
end
