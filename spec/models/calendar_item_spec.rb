require 'rails_helper'

RSpec.describe CalendarItem, type: :model do
 it { should validate_presence_of :title }
 it { should validate_presence_of :start_time }
end
