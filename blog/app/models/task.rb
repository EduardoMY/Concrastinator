class Task < ActiveRecord::Base
  belongs_to :priority
  belongs_to :tag
  belongs_to :user
  has_many :task_tags
  default_scope -> { joins(:priority).order('due_date, priorities.rank DESC') }
  validates :user_id, presence: true
  validates :tag_id, presence: true
  validates :priority_id, presence: true
  validates :due_date, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validate :not_past_date

	def not_past_date
	  if self.due_date.to_formatted_s(:db) < Time.now.to_formatted_s(:db)

	    errors.add(:due_date, 'not in past')
	  end
	end

end
