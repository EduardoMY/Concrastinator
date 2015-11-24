class Task < ActiveRecord::Base
  belongs_to :priority
  belongs_to :user
  has_many :task_tags
  has_many :tag, through: :task_tags
  default_scope -> { joins(:priority).order('priorities.rank DESC') }
  validates :user_id, presence: true
  validates :tag_id, presence: true
  validates :priority_id, presence: true
  validates :due_date, presence: true, date: true
  validates :title, presence: true, length: { maximum: 50 }
  validate :not_past_date

	def not_past_date
	  if self.due_date.to_formatted_s(:db) < Time.now.to_formatted_s(:db) 
      errors.add(:due_date, 'not in past')
	  end
	end

def self.search(query)
  where("tasks.title like ? or tasks.content like ?", "%#{query}%", "%#{query}%") 
end

end
=begin
  

=begin

# models/movie.rb
class Movie < ActiveRecord::Base
  has_many :showtimes
  has_many :theatres, through: :showtimes
end

# models/theatre.rb
class Theatre < ActiveRecord::Base
  has_many :showtimes
  has_many :movies, through: :showtimes
end

# models/showtime.rb
class ShowTime < ActiveRecord::Base
  belongs_to :movie
  belongs_to :theatre
end 
  
=end
  
end