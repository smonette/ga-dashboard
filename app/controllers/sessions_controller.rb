class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:id] = @user.id
      puts "!!!!!!!!!!create #{session[:id]}!!!!!!!!!!!!"

      puts "!!!!logged in!!!!!"

      redirect_to '/', notice: "you're logged in"
    else

      puts "!!!!!something went wrong!!!!!"

      flash.now[:error] = "Something went wrong"
      redirect_to '/'
    end
  end

  def destroy
    session[:id] = nil
    puts "!!!!!!!!!!!destroy #{session[:id]}!!!!!!!!!!!"

    redirect_to '/', notice: "you're logged out"
  end
end
