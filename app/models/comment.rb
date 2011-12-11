class Comment
	include Mongoid::Document 
	include Mongoid::Timestamps

	field :content
	field :guest_name
	field :guest_www
	field :guest_email

	belongs_to :user

	validates_presence_of :content
	
	validates_presence_of :guest_name
	validates_presence_of :guest_email

	validates_format_of :guest_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

	before_validation :set_guest_fields
	after_validation :unset_guest_fields

	def set_guest_fields
		unless self.user.blank?
			self.guest_name = self.user.name
			self.guest_email = self.user.email
		end
	end

	def unset_guest_fields
		unless self.user.blank?
			self.guest_name = nil
			self.guest_email = nil
		end
	end
end