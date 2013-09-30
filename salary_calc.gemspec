# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'salary_calc/version'

Gem::Specification.new do |spec|
  spec.name          = "salary_calc"
  spec.version       = SalaryCalc::VERSION
  spec.authors       = ["Adrian Perez"]
  spec.email         = ["adrianperez.deb@gmail.com"]
  spec.description   = %q{A very simple salary calculator}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/blackxored/salary_calc.rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
end
