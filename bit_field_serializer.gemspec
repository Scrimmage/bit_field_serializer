# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bit_field_serializer/version'

Gem::Specification.new do |spec|
  spec.name          = "bit_field_serializer"
  spec.version       = BitFieldSerializer::VERSION
  spec.authors       = ["Nick DeLuca"]
  spec.email         = ["nick@wescrimmage.com"]
  spec.description   = %q{Handles conversion of enum arrays to and from a bit field}
  spec.summary   = %q{Handles conversion of enum arrays to and from a bit field}
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.0"
end
