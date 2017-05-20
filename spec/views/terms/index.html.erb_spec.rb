# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'terms/index', type: :view do
  before(:each) do
    assign(:terms, [
             Term.create!(
               name: 'Name'
             ),
             Term.create!(
               name: 'Name'
             )
           ])
  end

  it 'renders a list of terms' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
  end
end
