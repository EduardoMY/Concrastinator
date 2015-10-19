class CreateTaskTags < ActiveRecord::Migration
  def change
    create_table :task_tags do |t|
      t.references :task, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :task_tags, [:task_id, :created_at]
    add_index :task_tags, [:tag_id, :created_at]
  end
end
