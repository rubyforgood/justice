# frozen_string_literal: true

FactoryGirl.define do
  factory :calendar_item do
  	title 'title'
  	body 'some text'
  	start_time Faker::Time.forward(23, :morning)
  	end_time Faker::Time.forward(23, :evening) 
  end
end
# params.require(:calendar_item).permit(:title, :body, :start_time, :end_time)