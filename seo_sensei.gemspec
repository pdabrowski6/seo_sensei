lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seo_sensei/version'

Gem::Specification.new do |s|
  s.add_development_dependency "rspec", '~> 3.7', '>= 3.7.0'
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
  s.add_development_dependency "activerecord", '>= 4.0.0'
  s.add_development_dependency "mysql2", '~> 0'
  s.add_development_dependency "timecop", '~> 0'
  s.add_development_dependency "factory_bot_rails", '>= 4.0.0'
  s.add_development_dependency "database_cleaner", '>= 1.0.0'
  s.required_ruby_version = '>= 2.5.0'
end
