class ChatGPTJob < ApplicationJob
    queue_as :default
  
    def perform(chat_id)
      chat = Chat.find(chat_id)
      # Use your ChatGPT integration to get a response
      response = ChatGPT.get_response(chat.message)
      chat.update(response: response)
    end
  end
  
  