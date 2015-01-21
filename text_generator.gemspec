# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'text_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "text_generator"
  spec.version       = TextGenerator::VERSION
  spec.authors       = ["McFreely"]
  spec.email         = ["paulmcfreely@gmail.com"]
  spec.summary       = %q{A gem to automatically generate text, using various schemas}
  spec.description   = %q{A gem to generate text. At the moment, the only method available is a Markov Model Generator, but more are to come later.}
  spec.homepage      = "https://github.com/McFreely/text_generator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'scalpel'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
