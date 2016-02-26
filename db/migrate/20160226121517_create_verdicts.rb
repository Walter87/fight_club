class CreateVerdicts < ActiveRecord::Migration
  def change
    create_table :verdicts do |t|
      t.integer :winner_id
      t.integer :loser_id

      t.timestamps null: false
    end
  end
end
