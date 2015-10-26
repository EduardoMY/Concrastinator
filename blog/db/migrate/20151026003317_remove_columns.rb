class RemoveColumns < ActiveRecord::Migration
  def self.up
  remove_column :users, :due_date
end

def self.down
  add_column :users, :due_date, :datetime
end
end
