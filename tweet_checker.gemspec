# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = "tweet_checker"
  s.version     = '0.1.0'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mike Admire"]
  s.email       = ["mike@mikeadmire.com"]
  s.homepage    = "http://github.com/mikeadmire/tweet_checker"
  s.summary     = "A simple twitter timeline checker"
  s.description = "TweetChecker is a simple twitter client library for checking the public timeline or a users friends timeline"
 
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "tweet_checker"
 
  s.add_dependency('json', '>=1.4.3')
  s.add_development_dependency('rspec')
 
  s.files = Dir.glob("{bin,lib}/**/*") + %w(README.rdoc tweet_checker.gemspec)
  s.executables  = []
  s.require_path = 'lib'
end

