class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :fighter_id
      t.integer :opponent_id

      t.timestamps null: false
    end
  end
end
