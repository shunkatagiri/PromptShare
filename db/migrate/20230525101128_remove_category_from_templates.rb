class RemoveCategoryFromTemplates < ActiveRecord::Migration[6.1]
  def change
    remove_column :templates, :category, :string
  end
end
