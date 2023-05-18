class AddCategoryIdToPromptTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :prompt_templates, :category_id, :integer
  end
end
