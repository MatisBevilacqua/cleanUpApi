class Api::V1::Test::TestsController < ApplicationController
  def index
      puts user_name = @current_user.name
  end
end
  