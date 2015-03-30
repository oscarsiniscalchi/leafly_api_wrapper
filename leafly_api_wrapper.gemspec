# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'leafly_api_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = 'leafly_api_wrapper'
  spec.version       = LeaflyApiWrapper::VERSION
  spec.authors       = ['Oscar Siniscalchi']
  spec.email         = ['oscarsiniscalchi@gmail.com']
  spec.summary       = %q{An api wrapper for leapfly api}
  spec.description   = %q{A simple API ruby wrapper to interact with leapfly api locations}
  spec.homepage      = 'https://github.com/oscarsiniscalchi/leafly_api_wrapper'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 0'
  spec.add_development_dependency 'rspec', '~> 0'
  spec.add_development_dependency 'vcr', '~> 0'
  spec.add_development_dependency 'webmock', '~> 0'

  spec.add_dependency 'faraday', '~> 0'
  spec.add_dependency 'json', '~> 1'
end
