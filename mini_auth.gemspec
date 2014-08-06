# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mini_auth/version'

Gem::Specification.new do |spec|
  spec.name          = "mini_auth"
  spec.version       = MiniAuth::VERSION
  spec.authors       = ["Michal Krzyzanowski"]
  spec.email         = ["michal.krzyzanowski+github@gmail.com"]
  spec.summary       = %q{Bullshit-free authentication library.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_dependency "naught"
end
