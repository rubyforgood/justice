# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Term, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many(:lessons).through(:lesson_terms) }
  it { should have_many(:lesson_terms) }
end
