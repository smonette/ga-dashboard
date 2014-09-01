class ShoutoutsController < ApplicationController
  def create
    user = User.find_by_id(session[:id])

    new_params = params.require(:shoutout).permit(:content)

    new_shoutout = Shoutout.new(new_params)

    if new_shoutout.save
      @shoutouts = user.shoutouts << new_shoutout
      render :json => @shoutouts
    else
      redirect_to '/'
    end

  end
end
