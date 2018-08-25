class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :current_user_loggin?, only: [:new, :edit, :show, :destroy]
  
  def index
    @blogs = Blog.all
    
  
  end
  
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
    
  end
  
  def create
    @blog = Blog.create(blog_params)
    @blog.user_id = current_user.id
    
    if @blog.save
      redirect_to blogs_path, notice:"それなっ！投稿したよ"
      ContactMailer.contact_mailer(current_user).deliver
    else
      render 'new'
    end
  end
  
  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
  
  def edit
  end
  
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "それなっ！を編集したよ"
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"それなっ！を削除したよ"
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id


    render :new if @blog.invalid?
  end
  
  
  
  private
  
  def blog_params
    params.require(:blog).permit(:content, :blog_img, :blog_img_cache)
    
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
  
  def current_user_loggin?
    if logged_in?
      #
    else
      
      redirect_to new_session_path, notice:"ログインしてね"
    end
  end
  
  
end
