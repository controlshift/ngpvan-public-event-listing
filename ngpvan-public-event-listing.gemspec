lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ngpvan_public_event_listing/version"

Gem::Specification.new do |spec|
  spec.name          = "ngpvan-public-event-listing"
  spec.version       = NgpvanPublicEventListing::VERSION
  spec.authors       = ["Nathan Woodhull"]
  spec.email         = ["nathan@controlshiftlabs.com"]

  spec.summary       = %q{Find URLs for EveryAction/VAN event forms}
  spec.description   = %q{NGPVAN does not have an officially supported way of accessing event form URLs by Event ID. This gem encapsulates various work arounds.}
  spec.homepage      = "https://github.com/controlshift/ngpvan-public-event-listing"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', '~> 0.15', '>= 0.15.3'
  spec.add_dependency 'faraday_middleware', '~> 0.12', '>= 0.12.2'
  spec.add_dependency 'mechanize', '~> 2.7', '>= 2.7.6'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'byebug'
end
