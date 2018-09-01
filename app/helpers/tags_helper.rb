module TagsHelper

	def img_header(tag)
		tag.variant(resize: "300x300")
	end

	def img_uploads(tag)
		tag.variant(resize: "200x200")
	end

	def img_resize(tag)
		tag.variant(resize: "600x600")
	end
	
end
