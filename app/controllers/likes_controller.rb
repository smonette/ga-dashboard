class LikesController < ApplicationController
  def create
    @user = User.find_by_id(session[:id])
    @shoutout = Shoutout.find_by_id(params[:parent_id])

    all_shoutout_likes = @shoutout.likes

    unique = true

    all_shoutout_likes.each do |compare_like|
      if compare_like.user_likes_id == @user.id
        unique = false
      end
    end

    if unique == true
      last_like = @shoutout.likes.order(created_at: :asc).last
      new_like = last_like["likes"] += 1
      @create_like = Like.create(likes: new_like, user_likes_id: @user.id)

      @shoutout.likes << @create_like
      redirect_to '/'
    else
      redirect_to '/'
    end
  end
end