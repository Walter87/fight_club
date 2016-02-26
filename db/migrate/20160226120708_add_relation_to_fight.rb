class AddRelationToFight < ActiveRecord::Migration
  def change
    add_column :fights, :relation, :text
  end
end
