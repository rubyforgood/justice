class CalendarItemsController < ApplicationController

  def index
    @calendar_items = CalendarItem.all
  end

  def new
    @calendar_item = CalendarItem.new
  end

  def create
    @calendar_items = CalendarItem.new(permitted_params)
  end

  private
  def permitted_params
    params.require(:calendar_items).permit(
      :title, :body, :start_time, :end_time
    )
  end

end
