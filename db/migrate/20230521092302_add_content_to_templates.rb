class AddContentToTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :templates, :content, :text
  end
end
