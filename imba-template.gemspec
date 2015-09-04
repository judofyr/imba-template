# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imba/template/version'

Gem::Specification.new do |spec|
  spec.name          = "imba-template"
  spec.version       = Imba::TEMPLATE_VERSION
  spec.authors       = ["Magnus Holm"]
  spec.email         = ["judofyr@gmail.com"]

  spec.summary       = %q{Bridge to the Imba compiler}
  spec.homepage      = "https://github.com/judofyr/imba-template"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "imba-source", ">= 0.12.1"
  spec.add_dependency "tilt", ">= 1", "< 3"
  spec.add_dependency "execjs", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'minitest', '~> 5.5'
end
