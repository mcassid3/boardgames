class CreateUserGames < ActiveRecord::Migration
  def change
    create_table :user_games do |t|
      t.integer :user_id, null:false
      t.integer :game_id, null:false
      t.integer :rating
      t.boolean :favorited, default: false
      t.timestamps null: false
    end
  end
end
