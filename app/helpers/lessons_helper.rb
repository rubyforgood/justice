# frozen_string_literal: true

module LessonsHelper
  def set_links_array(links)
    5.times do |i|
      unless links[i]
        links[i] = nil
      end
    end
  end
end
