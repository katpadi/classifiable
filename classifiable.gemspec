# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'classifiable/version'

Gem::Specification.new do |spec|
  spec.name          = "classifiable"
  spec.version       = Classifiable::VERSION
  spec.authors       = ["Kat Padilla"]
  spec.email         = ["hello@katpadi.ph"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.2"
  # spec.add_development_dependency "factory_girl_rails", "~> 4.0"

  spec.add_dependency('mysql2')
  spec.add_dependency('activerecord', "~> 4.2")
  spec.add_dependency('activesupport', "~> 4.2")
end
