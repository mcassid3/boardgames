class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id, null:false
      t.integer :game_id, null:false
      t.boolean :favorited, default:false
      t.timestamps(null:false)
    end
  end
end
