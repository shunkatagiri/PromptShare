class CreateUserPreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :user_preferences do |t|
      t.references :user, null: false, foreign_key: true
      t.text :preferences, null: false, default: {}.to_json

      t.timestamps
    end
  end
end
