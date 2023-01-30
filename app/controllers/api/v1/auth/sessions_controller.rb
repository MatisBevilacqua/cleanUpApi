class Api::V1::Auth::SessionsController < ApplicationController
  def create
    user = User.find_by(email: auth_params[:email])
    if user && user.authenticate(auth_params[:password])
      render json: { message: "connect" }, status: :created
      session[:user_token] = user.token
      puts "user_token: #{session[:user_token]}"
      puts "user info: #{user.inspect}"
      puts "user password: #{user.password_digest}"
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
