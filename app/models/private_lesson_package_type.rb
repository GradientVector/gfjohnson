class PrivateLessonPackageType < ActiveRecord::Base
  attr_accessible :cost_in_dollars, :duration_in_minutes, :name

  validates :name, presence: true, length: { maximum: 50 }
  validates :duration_in_minutes, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cost_in_dollars, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
