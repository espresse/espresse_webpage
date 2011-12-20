APP_ROOT = ::File.expand_path(::File.dirname(__FILE__))
SRF_ENV = ENV['RACK_ENV']

# load dependencies
require "bundler"
Bundler.setup
Bundler.require

require 'rack/contrib'
require "rack/csrf"

require APP_ROOT / "config" / "application.rb"

if ENV['RACK_ENV']=="development"
  #use Rack::ShowStatus      # Nice looking 404s and other messages
  use Rack::ShowExceptions  # Nice looking errors
  use Rack::Reloader
end

if ENV['RACK_ENV'] == "test"
end

if ENV['RACK_ENV'] == "production"
end

use Rack::Static, :urls => ["/css", "/images", "/javascripts"], :root => "public"
use Rack::Session::Cookie
use Rack::MethodOverride
use Rack::Flash
use Rack::JSONP
#use Rack::Csrf

run Application::AppRun

