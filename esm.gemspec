# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'esm/version'

Gem::Specification.new do |spec|
  spec.name          = "esm"
  spec.version       = Esm::VERSION
  spec.authors       = ["Tomasz Mazur"]
  spec.email         = ["defkode@gmail.com"]
  spec.description   = %q{ESM File Reader}
  spec.summary       = %q{for Digital Driver Cards}
  spec.homepage      = "https://www.trucky.eu"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 6"
  spec.add_dependency "bcd"
end
