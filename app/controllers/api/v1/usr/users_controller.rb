class Api::V1::Usr::UsersController < ApplicationController
  def show
    @user = UsersPros.find(params[:id])
    render json: { message: @user }, status: :ok
  end

  def create
    @user = User.find_by(token: request.headers["Authorization"].split(" ").last)
    comment = Comment.new(comment_params)
    if comment.save
      render json: { comment: comment }, status: :created
    else
      render json: { error: comment.errors }, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(token: @user.token)
  end
end


