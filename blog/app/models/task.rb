class Task < ActiveRecord::Base
  belongs_to :priority
  belongs_to :tag
  belongs_to :user
  validates :user_id, presence: true
  validates :tag_id, presence: true
  validates :priority_id, presence: true
end
