class Api::V1::User::CommentController < ApplicationController

  before_action :authenticate_user

  # POST http://localhost:3000/api/v1/user/1/comments/
  # Mettre un commentaire
  def create
    comment = Comment.new(comment_params)
    if comment.save
      user = User.find(params[:id])
      user.total_ranking ||= 0
      user.comment_count ||= 0
      user.average_ranking ||= 0
      user.total_ranking += comment.ranking
      user.comment_count += 1
      user.update_average_ranking
      render json: { comment: comment }, status: :created
    else
      render json: { error: comment.errors }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    user = @current_user
    send_info = user.id
    params.require(:comment).permit(:content, :ranking).merge(profile_id: params[:id], send: send_info)
  end

  def authenticate_user
    token = request.headers["Authorization"].split(" ").last
    @current_user = User.find_by(token: token)
  end
end
