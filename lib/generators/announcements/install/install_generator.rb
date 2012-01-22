module Announcements
	class InstallGenerator <  Rails::Generators::Base
		
		desc "Installs the Announcement gem"
		source_root File.expand_path('../templates', __FILE__)
		
		def create_model
			say "Creating an Announcement model in app/models ..."
			template 'announcement.rb', "app/models/announcement.rb"
			say "Creating the migration ..."
			generate("model", "announcement body:text public:integer --skip")
			say "Running the migration ..."
			rake("db:migrate")	
			say "Model created successfully!"
		end
		
		def create_other_files
			say "Copying announcement.js to vendor/assets/javascripts ..."
			template 'announcements.js', 'vendor/assets/javascripts'
			say "Javascripts created successfully!"
			say "IMPORTANT: Don't forget to add require announcements in application.js!"
		end
		
	end
end