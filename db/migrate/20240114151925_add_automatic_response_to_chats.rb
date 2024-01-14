class AddAutomaticResponseToChats < ActiveRecord::Migration[7.1]
  def change
    add_column :chats, :automatic_response, :text
  end
end
