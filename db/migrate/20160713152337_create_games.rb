class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :duration, null: false
      t.integer :player_count, null: false

      t.timestamps null: false
    end
  end
end
