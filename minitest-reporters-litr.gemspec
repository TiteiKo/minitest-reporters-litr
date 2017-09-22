# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest/reporters/litr/version'

Gem::Specification.new do |spec|
  spec.name          = 'minitest-reporters-litr'
  spec.version       = Minitest::Reporters::Litr::VERSION
  spec.authors       = ['Marion Duprey']
  spec.email         = ['titeiko@gmail.com']

  spec.summary       = 'Minitest reporter for [litr](https://github.com/Lothiraldan/litr)'
  spec.description   = 'Minitest reporter for [litr](https://github.com/Lothiraldan/litr)'
  spec.homepage      = 'https://github.com/TiteiKo/minitest-reporters-litr'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'

  spec.add_dependency 'minitest-reporters', '~> 1.1'
end
