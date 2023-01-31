class ApplicationController < ActionController::Base

  before_action :authenticate_user

  private

  def authenticate_user
    token = request.headers["Authorization"].split(" ").last
    @current_user = User.find_by(token: token)
  end

  protect_from_forgery with: :null_session
end
