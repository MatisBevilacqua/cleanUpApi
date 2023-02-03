class Api::V1::User::UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        comments = Comment.where(profile_id: user.id)
        comments.each do |comment|
            puts comment.content
        end
        render json: { name: user.name, username: user.username }, status: :ok
    end

    def index
        user = User.where(role: "pro")
        user.each do |users|
            puts users.username
        end
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
