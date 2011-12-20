module Application
	module Database
		Mongoid.load!('config/mongoid.yml')
	end
end