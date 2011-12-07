class Comment
	include Mongoid::Document 
	include Mongoid::Timestamps

	field :content
	field :guest_www
	field :guest_email

	belongs_to :user
end