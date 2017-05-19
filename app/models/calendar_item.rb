class CalendarItem < ApplicationRecord

  def start_time
    self.calendar_item.start
  end

end
