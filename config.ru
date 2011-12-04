APP_ROOT = ::File.expand_path(::File.dirname(__FILE__))

# load dependencies
require "bundler"
Bundler.setup
Bundler.require

require 'facets'

require 'simple_rack_framework'


require 'rack/contrib'
require "rack/csrf"
Tilt.prefer Tilt::ErubisTemplate

require APP_ROOT / "app" / "controllers" / "application_controller.rb"

# load app
Dir[APP_ROOT / "app" / "controllers" / "*.rb"].each { |f| require f }
Dir[APP_ROOT / "app" / "models" / "*.rb"].each { |f| require f }

require APP_ROOT / "config" / "router.rb"

Mongoid.load!('config/mongoid.yml')

if ENV['RACK_ENV']=="development"
  #use Rack::ShowStatus      # Nice looking 404s and other messages
  use Rack::ShowExceptions  # Nice looking errors
  use Rack::Reloader

  # use this only for developement environment
  # static files should be served by apache/nginx etc.
  # uncomment iif ythis 
   use Rack::Static, :urls => ["/css", "/images", "/javascripts"], :root => "public"

  #db:development
  
end

if ENV['RACK_ENV'] == "test"
  #db:test
  
end

if ENV['RACK_ENV'] == "production"

  #db:development
 
end


use Rack::Session::Cookie
use Rack::MethodOverride
use Rack::Flash
use Rack::JSONP
#use Rack::Csrf

run Application::Router

