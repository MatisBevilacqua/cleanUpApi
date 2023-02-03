class Api::V1::Auth::Client::RegistersController < ApplicationController
  def new
    render json: @user, status: :ok
  end

  #POST http://127.0.0.1:3000/api/v1/auth/client/sessions/
  def create
    @user = User.new(user_params)
    @user.role = 'client'
    if User.find_by_email(@user.email)
      render json:{ error: "L'email existe déja"}, status: :conflict
    end

    if @user.save
      render json: { success: "Utilisateur créé avec succès" }, status: :created
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :role)
  end
end
