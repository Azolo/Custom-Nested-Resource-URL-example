class PostsController < ApplicationController
  respond_to :html, :xml

  before_filter :find_user

  def index
    @posts = @user.posts.all
    respond_with @posts
  end

  def show
    @post = @user.posts.where(:user_post_id => (params[:id])).first
    respond_with [@user, @post]
  end

  def new
    @post = @user.posts.new
    respond_with [@user, @post]
  end

  def edit
    @post = @user.posts.where(:user_post_id => (params[:id])).first
    respond_with [@user, @post]
  end

  def create
    @post = @user.posts.new(params[:post])
    if @post.save
      flash[:notice] = "Successfully created post."
      respond_with [@user, @post]
    else
      respond_with @post
    end
  end

  def update
    @post = @user.posts.where(:user_post_id => (params[:id])).first
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      respond_with [@user, @post]
    else
      respond_with @post
    end
  end

  def destroy
    @post = @user.posts.where(:user_post_id => (params[:id])).first
    @post.destroy
    respond_with [@user, @post]
  end
end

private
  def find_user
    @user = User.find(params[:user_id])
  end
