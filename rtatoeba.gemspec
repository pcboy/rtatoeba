# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rtatoeba/version'

Gem::Specification.new do |spec|
  spec.name          = "rtatoeba"
  spec.version       = Rtatoeba::VERSION
  spec.authors       = ["David Hagege"]
  spec.email         = ["david.hagege@gmail.com"]
  spec.description   = %q{Tiny gem to get sample sentences from tatoeba.org}
  spec.summary       = %q{}
  spec.homepage      = "https://github.com/pcboy/rtatoeba"
  spec.license       = "WTFPL"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mechanize"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'

end
