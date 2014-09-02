class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    # @user = User.find_by_id(session[:id])
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
    if !new_file_path.blank?
      key = Time.now.to_time.to_i 

      new_bucket = S3_CLIENT.buckets['gadashboard']
      new_object = new_bucket.objects[key.to_s]

      new_object.write(Pathname.new(new_file_path['image_url'].tempfile.path))
      
      new_user[:image_url] = new_object.public_url.to_s
    else
      new_user[:image_url] = 'https://s3-us-west-1.amazonaws.com/gadashboard/profile-1.jpg'
    end
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
    @user = User.find(params[:id])
  end
  def edit
    @current_user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    updated_params = params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :image_url)
    new_file_path = params[:user].permit(:image_url)

    puts "!!!!!!!!!#{new_file_path}!!!!!!!!!!!!!"

    if !new_file_path.blank?
      key = Time.now.to_time.to_i 

      new_bucket = S3_CLIENT.buckets['gadashboard']
      new_object = new_bucket.objects[key.to_s]

      new_object.write(Pathname.new(new_file_path['image_url'].tempfile.path))

      updated_params[:image_url] = new_object.public_url.to_s
    else
      updated_params[:image_url] = user.image_url
    end

    if user.update_attributes(updated_params)
      redirect_to '/'
    else
      redirect_to edit_user
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    session[:id] = nil

    redirect_to '/'
  end
end
