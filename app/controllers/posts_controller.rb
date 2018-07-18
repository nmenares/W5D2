class PostsController < ApplicationController
before_action :require_login, only:[:edit, :update, :new, :create]


  def new
    render :new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id 
    @post.sub_id = params[:sub_id]
    if @post.save 
      redirect_to sub_url(@post.sub)
    else 
      flash.now[:errors] = @post.errors.full_messages
      render :new 
    end 
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to sub_url(@post.sub)
    else 
      flash.now[:errors] = ['Your comment trash try again']
      render :edit 
    end 
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    if @post.destroy 
      redirect_to sub_url(@post.sub_id)
    else 
      flash.now[:errors] = ['Cant delete post']
      render :show 
    end 
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end
  
  private 
  
  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
  
end
