# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'workflow_status/version'

Gem::Specification.new do |spec|
  spec.name          = "workflow_status"
  spec.version       = WorkflowStatus::VERSION
  spec.authors       = ["John Friel"]
  spec.email         = ["friel.john@gmail.com"]
  spec.summary       = "For CMS workflows that allow drafts, publishing and trashing, provides convenient, human-readable methods for an integer based ActiveRecord attribute"
  spec.description   = <<DESC
For CMS workflows that allow drafts, publishing and trashing, provides convenient, human-readable methods for an integer based ActiveRecord attribute
DESC
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.11"
end
