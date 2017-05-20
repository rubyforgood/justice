class LessonTerm < ApplicationRecord
  belongs_to :lesson
  belongs_to :term
end