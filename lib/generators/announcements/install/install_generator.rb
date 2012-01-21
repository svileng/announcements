module Announcements
	class InstallGenerator <  Rails::Generators::NamedBase
		desc <<-DESC
			Description:
				Blablabla
		DESC
		
		create_file "public/kurec.txt", "Test"
	end
end