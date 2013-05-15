require 'spec_helper'

feature 'Creating Events' do
  before do
    visit '/'
    click_link "New Event"
  end

  scenario "can create an event" do
    EVENT_TITLE = "Father's Day"

    fill_in 'Title', with: EVENT_TITLE
    select '2014', from: "event_date_1i"
    select 'June', from: "event_date_2i"
    select '15', from: "event_date_3i"
    click_button "Create Event"

    page.should have_content "Event has been created."
    event = Event.find_by_title EVENT_TITLE
    page.current_url.should == event_url(event)

    page.should have_content EVENT_TITLE
  end
end
