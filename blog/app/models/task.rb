class Task < ActiveRecord::Base
  belongs_to :priority
  belongs_to :tag
  belongs_to :user
  has_many :task_tags
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :tag_id, presence: true
  validates :priority_id, presence: true
  validates :due_date, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validate :not_past_date

	def not_past_date
	  if self.due_date.past?
	    errors.add(:due_date, 'not in past')
	  end
	end
end
