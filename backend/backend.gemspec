# frozen_string_literal: true
$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'backend/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'backend'
  s.version     = Backend::VERSION
  s.authors     = ['Sebastian Schkudlara']
  s.email       = ['sebastian.schkudlara@vizzuality.com']
  s.homepage    = 'http://www.vizzuality.com'
  s.summary     = 'Backend for Grid Arendal'
  s.description = ''
  s.license     = 'MIT'

  s.files = Dir['{app,config,lib}/**/*', 'Rakefile']

  s.add_dependency 'rails', '>= 5.0.0', '< 5.1'
  s.add_dependency 'devise'
end
