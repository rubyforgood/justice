class CalendarItem < ApplicationRecord
  validates_presence_of :title, :start_time

  def start_time
    created_at
  end
end
