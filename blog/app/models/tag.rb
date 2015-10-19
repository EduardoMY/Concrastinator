class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :task_tags
  has_many :tasks
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
end
