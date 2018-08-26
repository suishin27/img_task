class UsersController < ApplicationController
  before_action :set_user, only: [:show, :favorite_list]
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def favorite_list
  end

  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :user_img)
  end
  
  def set_user
    @user = User.find(params[:id])
    @favorites_blogs = @user.favorite_blogs
  end
  
end
