require 'spec_helper'

feature 'Viewing Events' do

  let!(:tomorrow) do
    FactoryGirl.create(:event,
                       :title => "Event Tomorrow",
                       :date => Date.today + 1)
  end
  let!(:current_day) do
    FactoryGirl.create(:event,
                       :title => "Event Today",
                       :date => Date.today)
  end

  before do
    visit '/'
  end

  scenario "can view events list" do
    within("#events") do
      page.should have_content("Event Tomorrow")
      page.should have_content("Event Today")
    end
  end

  scenario "events are shown with most recent events first"
  scenario "only upcoming events are shown"

end
