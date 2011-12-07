require 'mongoid'

class Post
	include Mongoid::Document 
	include Mongoid::Timestamps

	field :title
	field :permalink
	field :content
	field :preface
	field :is_published, :type => Boolean, :default => false

	index :permalink

	has_many :post_comments

	before_save :create_permalink

	def to_param
		"#{self.permalink}"
	end

	def opts
		{ :year => self.created_at.year, :month => self.created_at.month, :day => self.created_at.day }
	end
	
	def self.published
		self.where(:is_published => true)
	end

	def is_published?
		self.is_published
	end

	private

	def create_permalink
		self.permalink = self.title.downcase.gsub(/[(,?!\'":.)]/, '').gsub(' ', '-').gsub(/-$/, '')
	end
end