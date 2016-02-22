class AddPointsToFighters < ActiveRecord::Migration
  def change
    add_column :fighters, :points, :integer
  end
end
