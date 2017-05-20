class CalendarItemsController < ApplicationController

  def index
    @calendar_items = CalendarItem.all
  end

end
