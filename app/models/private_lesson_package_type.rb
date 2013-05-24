class PrivateLessonPackageType < ActiveRecord::Base
  attr_accessible :cost_in_dollars, :duration_in_minutes, :name

  after_initialize { self.is_active = true if new_record? }

  validates :name, presence: true, length: { maximum: 50 }
  validates :duration_in_minutes, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cost_in_dollars, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :is_active, inclusion: { in: [true, false] }
end
