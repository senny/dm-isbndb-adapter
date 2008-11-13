# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dm-isbndb-adapter}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yves Senn"]
  s.autorequire = %q{dm-isbndb-adapter}
  s.date = %q{2008-11-13}
  s.description = %q{a DataMapper adapter for isbndb}
  s.email = %q{yves.senn@gmail.com}
  s.extra_rdoc_files = ["README"]
  s.files = ["LICENSE", "README", "Rakefile", "lib/dm-isbndb-adapter.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://projects.dingolabs.ch}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{a DataMapper adapter for isbndb}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
