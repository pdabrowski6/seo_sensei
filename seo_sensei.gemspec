lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seo_sensei/version'

Gem::Specification.new do |s|
  s.add_runtime_dependency 'meta-tags', '2.11.1'
  s.add_runtime_dependency 'rails', '>= 5.2.3'
  s.add_development_dependency "rspec", '~> 3.7', '>= 3.7.0'
  s.add_development_dependency 'pry'
  s.name        = 'seo_sensei'
  s.version     = SeoSensei::Version
  s.date        = '2019-01-26'
  s.summary     = "Make your Rails application SEO-friendly"
  s.description = "Make your Rails application SEO-friendly"
  s.authors     = ["Paweł Dąbrowski"]
  s.email       = 'dziamber@gmail.com'
  s.files       = Dir['lib/**/*.rb', 'spec/helper.rb']
  s.homepage    =
    'http://github.com/rubyhero/seo_sensei'
  s.license       = 'MIT'
  s.required_ruby_version = '>= 2.5.0'
end
