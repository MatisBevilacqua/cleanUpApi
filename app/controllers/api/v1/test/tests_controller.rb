class Api::V1::Test::TestsController < ApplicationController

  before_action :authenticate_user

  private

  def authenticate_user
    token = request.headers["Authorization"].split(" ").last
    @current_user = User.find_by(token: token)
    if @current_user.nil?
      @current_user = UsersPros.find_by(token: token)
    end
  end
end
