require_relative 'lib/toy_robot/version'

Gem::Specification.new do |gem|
  gem.name          = "toy_robot"
  gem.version       = ToyRobot::VERSION
  gem.summary       = "Toy Robot Simulator"
  gem.description   = "A simulation of a toy robot moving on a square tabletop"
  gem.license       = "MIT"
  gem.authors       = ["Jacek Grzybowski"]
  gem.email         = "jacek213@gmail.com"
  gem.homepage      = "https://github.com/jacekgrzybowski/toy_robot"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'pry'
end
