class TaskTag < ActiveRecord::Base
  belongs_to :task, dependent: :destroy
  belongs_to :tag, dependent: :destroy
  validates :task_id, presence: true
  validates :tag_id, presence: true
end
