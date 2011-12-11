class PostComment < Comment
	belongs_to :post

	def parent
		self.post
	end
end