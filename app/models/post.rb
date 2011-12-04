require 'mongoid'

class Post
	include Mongoid::Document 
	include Mongoid::Timestamps

	field :title
	field :permalink
	field :content

	before_save :create_permalink

	def to_param
		self.permalink
	end
	
	private

	def create_permalink
		self.permalink = self.title.downcase.gsub(/[(,?!\'":.)]/, '').gsub(' ', '-').gsub(/-$/, '')
	end
end