require 'rubygems'
require 'rake/gempackagetask'
require 'rubygems/specification'
require 'spec'
require 'spec/rake/spectask'
require 'pathname'
require 'date'

ROOT = Pathname(__FILE__).dirname.expand_path

GEM = "dm-isbndb-adapter"
GEM_VERSION = "0.0.1"
AUTHOR = "Yves Senn"
EMAIL = "yves.senn@gmail.com"
HOMEPAGE = "http://projects.dingolabs.ch"
SUMMARY = "a DataMapper adapter for isbndb"

spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ['README']
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  
  # Uncomment this to add a dependency
  # s.add_dependency "isbndb"
  
  s.require_path = 'lib'
  s.files = %w(LICENSE README Rakefile TODO) + Dir.glob("{lib,specs}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "install the gem locally"
task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{GEM_VERSION}}
end

desc "create a gemspec file"
task :make_spec do
  File.open("#{GEM}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

desc 'Run specifications'
Spec::Rake::SpecTask.new(:spec) do |t|
  if File.exists?('spec/spec.opts')
    t.spec_opts << '--options' << 'spec/spec.opts'
  end
  t.spec_files = Pathname.glob((ROOT + 'spec/**/*_spec.rb').to_s)
end