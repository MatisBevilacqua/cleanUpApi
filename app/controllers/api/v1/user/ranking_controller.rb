class Api::V1::User::RankingController < ApplicationController
  def index
    user = User.where("average_ranking > ? and role = ?", 0, "pro")
    user_id = user.map(&:id)
    render json: { user: user_id }, status: :ok
  end

  private

  def authenticate_user
    token = request.headers["Authorization"].split(" ").last
    @current_user = User.find_by(token: token)
  end
end
