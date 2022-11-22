class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user =User.find(params[:id])
    @books = @user.books
  end

   def edit
  @user = User.find(params[:id])
   end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "うせr更新が成功しました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  # def create
  #   @post_image = PostImage.new(post_image_params)
  #   @post_image.user_id = current_user.id
  #   if @post_image.save
  #     redirect_to post_images_path
  #   else
  #     render :new
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to books_path
    end
  end

end
