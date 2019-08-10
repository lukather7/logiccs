# -*- encoding: utf-8 -*-
# stub: dotiw 3.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "dotiw".freeze
  s.version = "3.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Bigg".freeze, "Lauran Jansen".freeze]
  s.date = "2016-03-08"
  s.description = "dotiw is a gem for Rails that overrides the\n              default distance_of_time_in_words and provides\n              a more accurate output. Do you crave accuracy\n              down to the second? So do I. That's why I made\n              this gem. - Ryan".freeze
  s.email = ["radarlistener@gmail.com".freeze, "github@lauranjansen.com".freeze]
  s.homepage = "https://github.com/radar/dotiw".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Better distance_of_time_in_words for Rails".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>.freeze, [">= 3"])
      s.add_runtime_dependency(%q<i18n>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<tzinfo>.freeze, [">= 0"])
    else
      s.add_dependency(%q<actionpack>.freeze, [">= 3"])
      s.add_dependency(%q<i18n>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<tzinfo>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<actionpack>.freeze, [">= 3"])
    s.add_dependency(%q<i18n>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<tzinfo>.freeze, [">= 0"])
  end
end
