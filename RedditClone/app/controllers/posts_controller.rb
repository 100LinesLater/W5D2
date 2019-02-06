class PostsController < ApplicationController
  before_action :require_login
  
  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    @post.author = current_user.id 
    if @post.save!
      redirect_to post_url(@post)
    else 
    flash[:errors] = @post.errors.full_messages
    render :new
    end 
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy 
    redirect_to subs_url
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update(post_params)
    flash[:errors] = @post.errors.full_messages
    redirect_to post_url(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids:[])
  end

end
