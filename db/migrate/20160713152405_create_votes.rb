class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :comment_id, null: false
      t.string :up_or_down

      t.timestamps null: false
    end
  end
end
