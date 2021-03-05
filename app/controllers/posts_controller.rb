class PostsController < ApplicationController
  before_action :load_post, only: %i[show edit update destroy]

  def index
    @post = current_user.posts.build
    @posts = current_user.friend_and_own_posts
  end

  def show
    @comments = @post.comments.order(created_at: :desc)
    @comment = current_user.comments.build(post_id: @post.id)
  end

  def create
    @post = current_user.posts.build post_params
    respond_to do |format|
      if @post.save
        format.js do
          flash[:success] = 'Create successfully!'
          redirect_to posts_path
        end
      else
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update_attributes post_params
        format.js do
          flash[:success] = 'Update successfully!'
          redirect_to posts_path
        end
      else
        format.js
      end
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Destroy successfully!'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(%i[id title content image])
  end

  def load_post
    @post = current_user.posts.find_by(id: params[:id])
    return if @post
    flash[:error] = 'Not found data!'
    redirect_to posts_path
  end
end
