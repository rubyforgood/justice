# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LessonTerm, type: :model do
  it { should belong_to :lesson }
  it { should belong_to :term }
end
