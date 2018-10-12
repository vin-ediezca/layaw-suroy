module DestinationsHelper

	def img_blog(dest)
		dest.variant(resize: "200x200")
	end

	def check_dest_creator_views(dest)
		dest.tag.user == current_user
	end

end
