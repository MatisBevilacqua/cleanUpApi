class LoginsController < ApplicationController
  def create
    user = User.find_by(email: auth_params[:email])
    if user.authenticate(auth_params[:password])
      render json: { message: "connect" }, status: :created
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end

end
