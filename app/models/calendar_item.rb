class CalendarItem < ApplicationRecord
  validates_presence_of :title, :start_time

  def start_time
    self.calendar_item.start
  end
end
