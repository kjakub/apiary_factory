# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apiary_factory/version'

Gem::Specification.new do |gem|
  gem.name          = "apiary_factory"
  gem.version       = ApiaryFactory::VERSION
  gem.authors       = ["kjakub", "Jana Dvořáková (Jana4U)"]
  gem.email         = ["jakub.kuchar@virtualmaster.com", "jana4u@seznam.cz"]
  gem.description   = %q{Use your dictionaries for apiary.io with factory_girl in tests.}
  gem.summary       = %q{Use your dictionaries for apiary.io with factory_girl.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "factory_girl"

  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "activerecord"
end
