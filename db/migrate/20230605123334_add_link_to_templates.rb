class AddLinkToTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :templates, :link, :string
  end
end
