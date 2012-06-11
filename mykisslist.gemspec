lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name = 'mykisslist'
  s.version = '0.0.1'
  s.authors = ['Jeremy Bush']
  s.email = ['contractfrombelow@gmail.com']
  s.summary = 'Business logic files for my kiss list application'

  s.files = Dir['lib/**/*.rb']
  s.files.reject! { |fn| fn.include? 'version.rb' }
  s.require_path = 'lib'
end
