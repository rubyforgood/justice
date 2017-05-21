class CalendarItem < ApplicationRecord
  validates_presence_of :title, :start_time
end
