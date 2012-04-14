# announcements

The Announcements gem provides an easy way to publish short messages in your views, which the user can then hide permanently.
It was influenced by the gem `paul_revere` by thoughtbot, but unlike `paul_revere`, `announcements` doesn't use partials (instead,
there is a single helper method which you can customise) and is a bit more flexible (you have an additional 'type' attribute by default).

## Update:

Now by default `announcements` displays alerts in the `twitter-bootstrap` [style](http://twitter.github.com/bootstrap/components.html#alerts).

Be sure to use one of the twitter-bootstrap gems.

## Quick start

1. Requirements: rails >= 3.1.0 and jquery-rails
2. Add `gem 'announcements'` to your Gemfile and run `bundle`
3. Run `rails g announcements:install`
4. Use `<%= announce Announcement.newest %>` in your views to display the latest announcement
5. Create your first announcement in `rails c` by simply creating a new Announcement record, like `Announcement.create(:body => 'This is my first announcement!')`
6. Next, relax bootstrap's got the rest.

## Styling

By default, the announcement text and hide message text are wrapped in a div classed as "alert alert-block" consistent with Twitter Bootstrap. 

```html
<div class="alert alert-block">
	<a class="close" data-announcementid="1">x</a><h4 class="alert-heading">Warning!</h4>check yo self
</div>
```

## Customization

The default HTML output of the `announce` helper is

```html
<div class="alert alert-block">
	<a class="close" data-announcementid="1">x</a><h4 class="alert-heading">Warning!</h4>check yo self
</div>
```

The default div class is `info`. You can customise it like that:

```
<%= announce Announcement.newest, :div_class => "mydiv" %>
```

You can also change the "alert heading" text:

```
<%= announce Announcement.newest, :alert_heading => "Achtung!" %>
```

You can also change the "hide message" text:

```
<%= announce Announcement.newest, :hide_message => "×" %>
```

The output from the helper is marked as html_safe, so you can have links or add more formatting in the announcement text itself.

## How it works

The gem creates an Announcement model with a few class methods like `Announcement.newest`. The Announcement model has a body:text (the actual announcement text) 
and a type:string (which you can use for different types of announcements, e.g. public (everyone) and private (only for registered users)). There is also a js file in vendor/assets/javascripts
which permanently hides the announcement by creating a cookie (that's when you click on the 'hide message' text).

## How to uninstall

There is no uninstaller at this point, but you can simply remove the following files manually:

1. app/models/announcement.rb
2. vendor/assets/javascripts/announcements.js

You also have to remove the `//= require announcements` line in your app/assets/javascripts/application.js file, and rollback the `create_announcements` migration.