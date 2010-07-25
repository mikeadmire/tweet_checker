require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('tweet_checker', '0.1.0') do |p|
  p.summary        = "A simple method to access some twitter stuff."
  p.description    = ""
  p.url            = "http://github.com/mikeadmire/tweet_checker"
  p.author         = "Mike Admire"
  p.email          = "mike@mikeadmire.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
  p.runtime_dependencies = ["json >=1.4.3"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }


