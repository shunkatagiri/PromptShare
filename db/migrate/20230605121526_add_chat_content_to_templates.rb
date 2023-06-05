class AddChatContentToTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :templates, :chat_content, :text
  end
end
