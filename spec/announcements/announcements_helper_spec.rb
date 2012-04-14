require 'spec_helper'
include ActionView::Context
include ActionView::Helpers
include AnnouncementsHelper

describe AnnouncementsHelper do

  before do
    @announcement = Announcement.new
    @announcement.id = 1
    @announcement.body = "announcement text"
    
    @mocked_cookies = Hash.new
    stub!(:cookies).and_return(@mocked_cookies)
  end

  it "should output announcement text with no params" do
    @mocked_cookies["announcement_1"] = "not hidden"
    output = announce(@announcement)
    output.should include("x")
    output.should include("announcement text")
  end

  it "should not output announcement if was already hidden by user" do
    @mocked_cookies["announcement_1"] = "hidden"
    output = announce(@announcement)
    output.should be_nil
  end

  it "should outpu custom hide message and div class" do
    @mocked_cookies["announcement_1"] = "not hidden"
    output = announce(@announcement, hide_message: "X", div_class: "customdiv")
    output.should include("<div class=\"customdiv\"")
    output.should include(">X</a>")
  end

end