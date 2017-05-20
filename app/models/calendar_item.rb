class CalendarItem < ApplicationRecord
  validates_presence_of :title, :start_time

<<<<<<< HEAD
  def start_time
    self.calendar_item.start
  end
=======
>>>>>>> adding calendar view actions
end
