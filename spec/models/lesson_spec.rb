require 'rails_helper'

RSpec.describe Lesson, type: :model do
  it { should validate_presence_of :body }
  it { should validate_presence_of :lesson_type }
  it { should validate_presence_of :questions }
  it { should validate_presence_of :title }

  it { should have_and_belong_to_many :terms }

  it do
    should validate_inclusion_of(:lesson_type).
      in_array(["Activity-based", "Article-based"])
  end

  # TODO: validate that it has at least one term
end
