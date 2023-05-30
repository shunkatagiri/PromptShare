# db/migrate/*_add_likes_count_to_templates.rb

def change
  add_column :templates, :likes_count, :integer, default: 0, null: false
end
