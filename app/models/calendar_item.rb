class CalendarItem < ApplicationRecord

  def start_time
    created_at
  end

end
