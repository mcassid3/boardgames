class CreateGameTags < ActiveRecord::Migration
  def change
    create_table :game_tags do |t|
      t.integer :game_id, null: false
      t.integer :tag_id, null: false

      t.timestamps null: false
    end
  end
end
