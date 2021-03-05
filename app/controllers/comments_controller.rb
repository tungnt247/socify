class CommentsController < ApplicationController
  before_action :load_post
  before_action :load_comment, only: %i[update destroy]
  
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = @post.id
    @comment.save
    redirect_to post_path(@post.id)
  end

  def update
    if @comment.update_attributes comment_params
      redirect_to post_path(@post.id)
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def load_post
    @post = Post.find_by(id: params[:post_id])
  end

  def load_comment
    @comment = current_user.comments.find_by(id: params[:id])
  end
end
