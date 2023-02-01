class Api::V1::User::Pro::CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    if comment.save 
      render json: { comment: comment }, status: :created
    else
      render json: { error: comment.errors }, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    user = @current_user
    send_info = user.username
    params.require(:comment).permit(:content).merge(profile_id: params[:id], send: send_info)
  end
end

