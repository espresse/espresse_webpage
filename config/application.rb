module Application
	require 'facets'
	require 'simple_rack_framework'

	require "#{APP_ROOT}/app/controllers/application_controller.rb"

	Dir["#{APP_ROOT}/app/controllers/*.rb"].each {|file| require file }
	Dir["#{APP_ROOT}/app/models/*.rb"].each {|file| require file }

	require "#{APP_ROOT}/config/router.rb"

	require "#{APP_ROOT}/config/database.rb"

	if SRF_ENV=="development"
	  #put some development dependiences here
	elsif SRF_ENV == "test"
		#put some test dependiences here
	elsif SRF_ENV == "production"
		#put some production dependiences here
	end

	Tilt.prefer Tilt::ErubisTemplate

	AppRun = Application::Router

end