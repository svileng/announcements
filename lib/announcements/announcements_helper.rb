module AnnouncementsHelper

	# Outputs given announcement in HTML.
	# 
	# Basic usage: <%= announce Announcement.newest %>
	#
	# Options:
	# div_class -- name for a custom div class, which wraps the announcement text and hide message, default is "info"
	# hide_message -- clickable text which hides the announcement, default is "hide message"
	def announce announcement, options = {}
		text = options[:hide_message] || "x"
		div_class = options[:div_class] || "alert alert-block"
		alert_heading = options[:alert_heading] || "Warning!"
		if announcement != nil && cookies["announcement_" + announcement.id.to_s] != "hidden"
			content_tag :div, :class => div_class do
				result = content_tag(:h4, alert_heading, :class => "alert-heading")
				result << content_tag(:a, text, :class => "close", :data => { :announcementid => announcement.id })
				result << announcement.body.html_safe
				result
			end
		end
	end

end