class Api::V1::User::Pro::UsersController < ApplicationController
    def show    
        user = UsersPros.find(params[:id])
        comments = Comment.where(profile_id: user.id)
        comments.each do |comment|
            puts comment.content
        end
        render json: { name: user.name, username: user.username }, status: :ok 
    end
end