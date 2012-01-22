module AnnouncementsHelper

	def announce announcement, text = "hide message"
		if announcement != nil && cookies["announcement_" + announcement.id.to_s] != "hidden"
			concat content_tag :div, :class => "info" do
				concat announcement.body.html_safe
				concat content_tag :span, text, :class => "hide_announcement", :data => { :announcementid => announcement.id }
			end
		end
	end

end