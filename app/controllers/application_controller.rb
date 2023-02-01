class ApplicationController < ActionController::Base

  before_action :authenticate_user

  private

  def authenticate_user
    token = request.headers["Authorization"].split(" ").last
    @current_user = User.find_by(token: token)
    if @current_user.nil?
      @current_user = UsersPros.find_by(token: token)
    end
    
    if @current_user.nil? && @current_userPro.nil?
      raise StandardError, "Authentication failed: no user found for given token"
    end
  end

  protect_from_forgery with: :null_session
end
