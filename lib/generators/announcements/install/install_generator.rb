module Announcements
	class InstallGenerator <  Rails::Generators::Base
		
		desc "Installs the Announcement gem"
		source_root File.expand_path('../templates', __FILE__)
		
		def create_model
			say "--- Creating model in app/models..."
			template "announcement.rb", "app/models/announcement.rb"
			say "--- Creating the migration ..."
			generate("model", "announcement body:text public:integer --skip")
			say "--- Running the migration..."
			rake("db:migrate")	
		end
		
		def create_js_files
			say "--- Copying js to vendor/assets/javascripts..."
			template "announcements.js", "vendor/assets/javascripts/announcements.js"
			say "--- Adding require in app/assets/javascripts/application.js..."
			insert_into_file "app/assets/javascripts/application.js", "//= require announcements\n", :after => "jquery_ujs\n"
		end
				
	end
end