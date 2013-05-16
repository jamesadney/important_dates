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

  #TODO: Should set id of events to make sure that this test is still
  #      valid even if the order of the lets above is changed.
  scenario "events are shown with most recent events first" do
    page.text.should match(/Event Today.+Event Tomorrow/m)
  end
  scenario "only upcoming events are shown"

end
