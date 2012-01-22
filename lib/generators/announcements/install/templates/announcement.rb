# Represents a public service announcement by admins to the users
class Announcement < ActiveRecord::Base

  validates_presence_of :body

  def self.newest_private
    Announcement.where("public = '0'").order("id desc").first
  end

  def self.newest_public
    Announcement.where("public = '1'").order("id desc").first
  end
end
