class Api::V1::Profil::CommentsController < ApplicationController  

  def create
    @user = User.find(params[:id])
    @comment = @user.comments.new(comment_params)
    if @comment.save
      render json: { message: "Commentaire ajouté avec succès" }, status: :created
    else
      render json: { error: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(profile_id: @user.id)
  end
end
  #def show
    #@user = UsersPros.find(params[:id])
    #puts @user.id
    #render json: { message: @user }, status: :ok
  #end
  

