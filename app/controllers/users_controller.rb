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
    new_file_path = params[:user].permit(:image_url)

    key = Time.now.to_time.to_i 

    new_bucket = S3_CLIENT.buckets['gadashboard']
    new_object = new_bucket.objects[key.to_s]

    puts "!!!!!!!!!!!!!!!!!#{new_file_path}!!!!!!!!!!!!!!!!!!"
    puts "!!!!!!!!!!!!!!!!!#{new_file_path['image_url'].tempfile.path}!!!!!!!!!!!!!!!!!"

    new_object.write(Pathname.new(new_file_path['image_url'].tempfile.path))
    
    new_user[:image_url] = new_object.public_url.to_s
    puts "!!!!!!!!!!!!#{new_object.public_url.to_s}"
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
