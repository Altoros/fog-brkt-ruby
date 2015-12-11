lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fog/brkt/version"

Gem::Specification.new do |spec|
  spec.name          = "fog-brkt"
  spec.version       = Fog::Brkt::VERSION
  spec.authors       = ["Maksim Zhylinski", "Berndt Jung"]
  spec.email         = ["berndt@brkt.com"]
  spec.summary       = %q{Module for the "fog" gem to support Bracket Computing.}
  spec.description   = %q{This library can be used as a module for `fog` or as standalone provider
                        to use the Bracket Computing services in applications..}
  spec.homepage      = "https://github.com/brkt/fog-brkt-ruby"
  spec.license       = "Apache 2.0"

  spec.files         = Dir['*.rb'] + Dir['lib/**/*'] + Dir['spec/**/*'] + Dir['doc/**/*']
  spec.files         += Dir['fog-brkt.gemspec'] + Dir['Gemfile'] + Dir['Rakefile'] + Dir['*.md']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.4"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "awesome_print"

  spec.add_dependency "net-ssh", "~> 3.0.1"
  spec.add_dependency "net-scp", "~> 1.2.1"
  spec.add_dependency "fog-core", "~> 1.29"
  spec.add_dependency "fog-xml", "~> 0.1"
  spec.add_dependency "fog-json", "~> 1.0"
  spec.add_dependency "yard", "~> 0.8"
  spec.add_dependency "pry", "~> 0.10"
end
