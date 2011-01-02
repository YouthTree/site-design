#\ -p 4000

gem 'activesupport'
gem 'serve'

require 'serve'
require 'serve/rack'

require 'sass/plugin/rack'
require 'barista'

# The project root directory
root = ::File.dirname(__FILE__)

# Barista (for CoffeeScript Support)
Barista.app_root = root
Barista.root     = File.join(root, 'coffeescripts')
Barista.setup_defaults
barista_config = root + '/barista_config.rb'
require barista_config if File.exist?(barista_config)

Sass::Plugin.options[:template_location] = { 'sass' => 'public/stylesheets' }

# Rack Middleware
use Rack::ShowStatus      # Nice looking 404s and other messages
use Rack::ShowExceptions  # Nice looking errors
use Sass::Plugin::Rack    # Compile Sass on the fly
use Barista::Filter
use Barista::Server::Proxy

# Rack Application
if ENV['SERVER_SOFTWARE'] =~ /passenger/i
  # Passendger only needs the adapter
  run Serve::RackAdapter.new(root + '/views')
else
  # We use Rack::Cascade and Rack::Directory on other platforms to handle static 
  # assets
  run Rack::Cascade.new([
    Serve::RackAdapter.new(root + '/views'),
    Rack::Directory.new(root + '/public')
  ])
end
