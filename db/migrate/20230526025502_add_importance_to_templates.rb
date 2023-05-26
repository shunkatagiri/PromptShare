class AddImportanceToTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :templates, :importance, :integer
  end
end
