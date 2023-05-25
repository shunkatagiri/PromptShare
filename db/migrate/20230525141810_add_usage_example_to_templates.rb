class AddUsageExampleToTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :templates, :usage_example, :text
  end
end
