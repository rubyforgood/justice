class Admin::CalendarItemsController < Comfy::Admin::Cms::BaseController

  def index
    @calendar_items = CalendarItem.all
  end

  def new
    @calendar_item = CalendarItem.new
  end

  def create
    @calendar_item = CalendarItem.new(calendar_item_params)
    if @calendar_item.save
      redirect_to [:admin, @calendar_item]
    else
      render :new
    end
  end

  def show
    @id = params[:id]
    @calendar_item = CalendarItem.find(@id)
  end

  def edit
    @calendar_item = CalendarItem.find(params[:id])
  end

  def update
    calendar_item = CalendarItem.find(params[:id])
    calendar_item.update(calendar_item_params)
    redirect_to admin_calendar_item_path(calendar_item)
  end

  def destroy
    @calendar_item = CalendarItem.find(params[:id])
    @calendar_item.destroy
    redirect_to admin_calendar_items_path
  end

  private
  def calendar_item_params
    start_time = params[:calendar_item][:start_time]
    params[:calendar_item][:start_time] = ActiveSupport::TimeZone[Time.zone.name].parse(start_time) if start_time.present?
    params.require(:calendar_item).permit(:title, :body, :start_time, :end_time)
  end

end
