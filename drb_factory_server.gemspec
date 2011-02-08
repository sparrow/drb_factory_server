Gem::Specification.new do |s|
  s.name = 'drb_factory_server'
  s.version = '0.0.1'
  s.author = 'Vladimir Vorobyov'
  s.email = 'sparrowpublic@gmail.com'
  s.summary = 'Remote factory server for ActiveResource'

  s.require_path = 'lib'
  s.files = Dir.glob('{lib,rails}/**/*') + %w(drb_factory_server.gemspec README)
end