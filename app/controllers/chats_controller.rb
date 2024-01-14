class ChatsController < ApplicationController
    before_action :authenticate_user!
    def create
      @chat = Chat.create(params.require(:chat).permit(:message))
      @chat.user = current_user
      if @chat.save
      flash[:notice] = "successfully saved"
      redirect_to chats_path
      else
        render 'root_path'
      end
    end
    def index
      @chats = Chat.where(user_id: current_user)
      @chat = Chat.new
    end
  end