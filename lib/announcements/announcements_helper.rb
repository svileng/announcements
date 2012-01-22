module AnnouncementsHelper

	# Outputs given announcement in HTML.
	# 
	# Basic usage: <%= announce Announcement.newest %>
	#
	# Options:
	# div_class -- name for a custom div class, which wraps the announcement text and hide message, default is "info"
	# hide_message -- clickable text which hides the announcement, default is "hide message"
	def announce announcement, options = {}
		text = options[:hide_message] || "hide message"
		div_class = options[:div_class] || "info"
		if announcement != nil && cookies["announcement_" + announcement.id.to_s] != "hidden"
			content_tag :div, :class => div_class do
				result = announcement.body.html_safe
				result << content_tag(:span, text, :class => "hide_announcement", :data => { :announcementid => announcement.id })
				result
			end
		end
	end

end