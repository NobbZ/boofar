# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'boofar/version'

Gem::Specification.new do |spec|
  spec.name          = 'boofar'
  spec.version       = Boofar::VERSION
  spec.authors       = ['Norbert Melzer']
  spec.email         = ['timmelzer@gmail.com']

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{TODO: Write a short summary, because Rubygems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = %q{TODO: Put your gem's website or public repo URL here.}
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'trollop', '~> 2.1.2'

  spec.add_development_dependency 'bundler',   '~> 1.8'
  spec.add_development_dependency 'rake',      '~> 10.0'
  spec.add_development_dependency 'rspec',     '~> 3.0'
  spec.add_development_dependency 'fuubar',    '~> 2.0.0'
  spec.add_development_dependency 'yard',      '~> 0.8.7.6' unless RUBY_PLATFORM == 'java'
  spec.add_development_dependency 'redcarpet', '~> 3.2.2'   unless RUBY_PLATFORM == 'java'
end
