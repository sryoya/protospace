class CommentsController < ApplicationController
  def create
    Comment.create(create_params)
    @comments = Comment.all
  end

  private
  def create_params
    params.require(:comment).permit(:comment, :proto_id).merge(user_id: current_user.id)
  end

end
