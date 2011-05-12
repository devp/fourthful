# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fourthful}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dev Purkayastha"]
  s.date = %q{2011-05-12}
  s.description = %q{A library for working with D&D 4th Edition Character Sheets.}
  s.email = %q{dev@forgreatjustice.net}
  s.extra_rdoc_files = [
    "LICENSE",
    "README",
    "TODO"
  ]
  s.files = [
    "CHANGELOG",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "Manifest",
    "README",
    "Rakefile",
    "TODO",
    "VERSION",
    "fourthful.gemspec",
    "init.rb",
    "lib/fourthful.rb",
    "lib/fourthful/character.rb",
    "lib/fourthful/character_sheet.rb",
    "lib/fourthful/dnd4e_file.rb",
    "lib/fourthful/power.rb",
    "lib/fourthful/skill.rb",
    "test/data/Irruos.dnd4e",
    "test/data/Keira.dnd4e",
    "test/data/Slayer.dnd4e",
    "test/examples/irruos_test.rb",
    "test/examples/keira_test.rb",
    "test/test_helper.rb",
    "test/unit/character_test.rb",
    "test/unit/dnd4e_file_test.rb"
  ]
  s.homepage = %q{http://github.com/devp/fourthful-ruby}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{A library for working with D&D 4th Edition Character Sheets.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
  end
end
