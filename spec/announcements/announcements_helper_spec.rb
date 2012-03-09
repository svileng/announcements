require 'spec_helper'
include ActionView::Context
include ActionView::Helpers
include AnnouncementsHelper

describe AnnouncementsHelper do

  before do
    @announcement = Announcement.new # mock object
    @announcement.body = "announcement text"
  end

  it "should output announcement text with no params" do
    stub!(:cookies).and_return("hidden")
    output = announce(@announcement)
    output.should include("hide message")
    output.should include("announcement text")
  end
end