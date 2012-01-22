
## Quick start

1. Requirements: rails >= 3.1.0 and jquery
2. Add `gem 'announcements'` to your Gemfile and run `bundle`
3. Run `rails g announcements:install`
4. Use `<%= announce Announcement.newest %>` in your views to display the latest announcement
5. Create your first announcement in `rails c` by simply creating a new Announcement record, like `Announcement.create(:body => 'This is my first announcement!')`
6. Next, add some CSS (find an example below; the default output is quite plain and ugly) and customise it.

## Styling

## Customisation

## How it works

## How to uninstall

There is no uninstaller at this point, but you can simply remove the following files manually:

1. app/models/announcement.rb
2. vendor/assets/javascripts/announcements.js

You also have to remove the `//= require announcements` line in your app/assets/javascripts/application.js file, and rollback the `create_announcements` migration.