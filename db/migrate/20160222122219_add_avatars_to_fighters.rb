class AddAvatarsToFighters < ActiveRecord::Migration
  def self.up
    change_table :fighters do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :fighters, :avatar
  end
end
