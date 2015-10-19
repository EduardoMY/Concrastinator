class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.references :priority, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :tasks, [:user_id, :created_at]
    add_index :tasks, [:tag_id, :created_at]
    add_index :tasks, [:priority_id, :created_at]
  end
end
