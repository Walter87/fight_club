class AddColumnToVerdict < ActiveRecord::Migration
  def change
    add_column :verdicts, :fight_id, :integer
  end
end
