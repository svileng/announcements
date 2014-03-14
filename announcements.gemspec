# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "announcements/version"

Gem::Specification.new do |s|
  s.name        = "announcements"
  s.version     = Announcements::VERSION
  s.authors     = ["Svilen Gospodinov", "and others"]
  s.email       = "svilen.gospodinov@gmail.com"
  s.homepage    = "https://github.com/svileng/announcements"
  s.summary     = "Announcements gem for Rails"
  s.description = "The Announcements gem makes it easier to display short announcement messages in your views"

  s.rubyforge_project = "announcements"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"

  s.add_runtime_dependency "rails", ">= 3.1.0"
  s.add_runtime_dependency "jquery-rails"

end
