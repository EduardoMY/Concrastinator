class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :title
      t.integer :rank
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :priorities, [:user_id, :created_at]
  end
end
