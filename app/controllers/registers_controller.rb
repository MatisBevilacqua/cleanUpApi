class RegistersController < ApplicationController
  def new
    @user = User.new
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if User.find_by_email(@user.email)
      render json:{ error: "L'email existe déja"}, status: :conflict
    end

    if @user.save
      render json: { success: "Utilisateur créé avec succès" }, status: :created
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end 
end
