class CalendarItem < ApplicationRecord
  validates_presence_of :start_time, :end_time
end
