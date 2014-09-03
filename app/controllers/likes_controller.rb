class LikesController < ApplicationController
  def create
    @user = User.find_by_id(session[:id])
    @shoutout = Shoutout.find_by_id(params[:parent_id])

    last_like = @shoutout.likes.order(created_at: :asc).last
    new_like = last_like["likes"] += 1
    @create_like = Like.create(likes: new_like, user_likes_id: @user)

    @shoutout.likes << @create_like
    redirect_to '/'
  end
end
