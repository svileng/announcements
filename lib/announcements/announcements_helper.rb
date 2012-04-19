module AnnouncementsHelper

	# Outputs given announcement in HTML (with optional twitter bootstrap style).
	# 
	# Basic usage: <%= announce Announcement.newest %>
	#
	# Alt usage: <%= announce Announcement.newest, :format => "boostrap" %>
	#
	# Options:
	# div_class -- name for a custom div class, which wraps the announcement text and hide message, default is "info"
	# hide_message -- clickable text which hides the announcement, default is "hide message"
	# format[:boostrap] -- format announcement to use the twitter bootstrap Alert style, defaults to normals stylings.
	# alert_heading -- Adding an alert heading when used with the bootstrap option.
	def announce announcement, options = {}
		if options[:format] == "bootstrap"
			text = options[:hide_message] || "x"
			div_class = options[:div_class] || "alert alert-block"
			alert_heading = options[:alert_heading] || "Warning!"
			if announcement != nil && cookies["announcement_" + announcement.id.to_s] != "hidden"
				content_tag :div, :class => div_class do
					result = content_tag(:a, text, :class => "close", :data => { :announcementid => announcement.id })
					result << content_tag(:h4, alert_heading, :class => "alert-heading")
					result << announcement.body.html_safe
					result
				end
			end
		else
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

end