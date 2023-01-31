class Api::V1::Test::TestsController < ApplicationController
  def index
      user = @current_user
      puts user.token
  end
end
  