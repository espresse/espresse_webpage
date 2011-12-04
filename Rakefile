require 'bundler'
APP_ROOT = ::File.expand_path(::File.dirname(__FILE__))
task :default => [:test]

test_tasks = ['test:models']
desc "Run all tests"
task :test => test_tasks

namespace :test do
  desc "Run model tests"
  ENV['RACK_ENV'] = "test"
  #sh "rackup config.ru -p 9999 -D"
  task :models do
   require 'facets'
	
	 require 'simple_rack_framework'
   
    require "#{APP_ROOT}/app/controllers/application_controller.rb"

	# load app
	#Dir["#{APP_ROOT}/app/controllers/*.rb"].each { |f| require f }
	Dir["#{APP_ROOT}/app/models/*.rb"].each { |f| require f }

	#require "#{APP_ROOT}/config/router.rb"

    Dir['./spec/**/*.rb'].each { |test| require test }
  end

  #sh "kill -9 `ps axu | grep [r]ackup | awk '{print $2}'`"
end