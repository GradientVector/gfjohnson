class LessonType < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  default_scope order: 'lesson_types.name ASC'
end
