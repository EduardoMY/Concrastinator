class Task < ActiveRecord::Base
  belongs_to :priority
  belongs_to :tag
  belongs_to :user
  has_many :task_tags
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :tag_id, presence: true
  validates :priority_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
end
