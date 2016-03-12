# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emberjs_website_styles/version'

Gem::Specification.new do |spec|
  spec.name          = "emberjs_website_styles"
  spec.version       = EmberjsWebsiteStyles::VERSION
  spec.authors       = ["Nate Amack"]
  spec.email         = ["nate@amack.org"]

  spec.summary       = %q{The shared styles for the EmberJS website and guides}
  spec.description   = %q{SASS files for unified EmberJS website and guides}
  spec.homepage      = "https://github.com/namack/emberjs_website_styles"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bourbon", ">= 4.0"
  spec.add_dependency "neat", ">= 1.7.2"
  spec.add_runtime_dependency "sass", "~> 3.4"
  spec.add_runtime_dependency "thor", "~> 0.19"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
