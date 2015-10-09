class TaskTag < ActiveRecord::Base
  belongs_to :task
  belongs_to :tag
  validates :task_id, presence: true
  validates :tag_id, presence: true
end
