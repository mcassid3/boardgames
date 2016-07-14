class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :max_players, null: false
      t.string :min_playing_time, null: falses
      t.string :photo, null:false
      t.timestamps null: false
    end
  end
end
