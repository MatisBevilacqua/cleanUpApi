class Api::V1::User::Pro::CommentsController < ApplicationController

  before_action :authenticate_user

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

  def authenticate_user
    token = request.headers["Authorization"].split(" ").last
    @current_user = User.find_by(token: token)
    if @current_user.nil?
      @current_user = UsersPros.find_by(token: token)
    end
  end
end

