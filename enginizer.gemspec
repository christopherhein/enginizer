$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enginizer/version"

Gem::Specification.new do |gem|
  gem.name          = "enginizer"
  gem.version       = Enginizer::version
  gem.authors       = ["Christopher Hein"]
  gem.email         = ["me@christopherhein.com"]
  gem.homepage      = "http://chrishein.com"
  gem.summary       = "Command line tool for building modular rails applications."
  gem.description   = "Command line tool for building modular rails applications."

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "thor"
  gem.add_dependency "rvm"
  gem.add_dependency "rails"
end
