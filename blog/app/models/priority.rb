class Priority < ActiveRecord::Base
  belongs_to :user
  has_many :tasks 
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :rank, presence: true
  default_scope -> { order('rank DESC') }
end
