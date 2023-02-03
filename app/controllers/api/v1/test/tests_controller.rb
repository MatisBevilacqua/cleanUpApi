class Api::V1::Test::TestsController < ApplicationController

  before_action :authenticate_user

  def index
      puts user_name = @current_user.name
  end

  private

  def authenticate_user
    token = request.headers["Authorization"].split(" ").last
    @current_user = User.find_by(token: token)
    if @current_user.nil?
      @current_user = UsersPros.find_by(token: token)
    end
  end
end
