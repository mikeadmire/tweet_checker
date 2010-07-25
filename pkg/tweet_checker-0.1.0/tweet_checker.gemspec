# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tweet_checker}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Admire"]
  s.date = %q{2010-07-25}
  s.description = %q{A simple method to access some twitter stuff.}
  s.email = %q{mike@mikeadmire.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/tweet_checker.rb"]
  s.files = ["README.rdoc", "Rakefile", "lib/tweet_checker.rb", "spec/sample.json", "spec/spec.opts", "spec/spec_helper.rb", "spec/tweet_checker_spec.rb", "Manifest", "tweet_checker.gemspec"]
  s.homepage = %q{http://github.com/mikeadmire/tweet_checker}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Tweet_checker", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{tweet_checker}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A simple method to access some twitter stuff.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 1.4.3"])
    else
      s.add_dependency(%q<json>, [">= 1.4.3"])
    end
  else
    s.add_dependency(%q<json>, [">= 1.4.3"])
  end
end
