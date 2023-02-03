class Api::V1::Auth::Pro::SessionsController < ApplicationController

  def create
    user = User.find_by(email: auth_params[:email])
    if user && user.authenticate(auth_params[:password])
      render json: { Bienvenue: user.username }, status: :created
      session[:user_token] = user.token
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
