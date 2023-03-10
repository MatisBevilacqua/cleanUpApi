class Api::V1::User::ChatController < ApplicationController
  before_action :authenticate_user

  # POST  http://localhost:3000/api/v1/user/1/chats/
  # Envoyer un message
  def create
    chat = Chat.new(chat_params)
    if chat.save
      render json: { message: 'chat successfully created' }, statut: :created
    else
      render json: { message: chat.errors }, status: :unprocessable_entity
    end
  end

  # GET http://localhost:3000/api/v1/user/chats/index
  # Afficher les id de ce à qui nous avons envoyer un message
  def index
    user = @current_user
    id_send_arr = []
    send = Chat.where(id_send: user.id)
    send.each do |chat|
      id_send_arr.push(chat.id_send)
    end
    id_send_arr.uniq!
    id_send_arr.each do |chat_id|
      puts chat_id
    end
  end

  private

  def chat_params
    user = @current_user
    user_send = user.id
    params.require(:chat).permit(:message).merge(id_receive: params[:id], id_send: user_send)
  end

  # Récupérer le token
  def authenticate_user
    token = request.headers["Authorization"].split(" ").last
    @current_user = User.find_by_token(token)
  end
end
