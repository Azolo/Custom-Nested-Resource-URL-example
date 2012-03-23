class UsersBatchController < ApplicationController
  def users_edit
    @user_set = UserSet.new
    @user_set.users = User.all

    # Add a new user
    @user_set.users << User.new

    # Make some dummy blank unsaved posts
    @user_set.make_some_posts

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def users_post
    @users = UserSet.users_from(params[:user_set])

    # Create your implementation to save HERE
    raise "#{@users.join("\n")}"
  end
end

