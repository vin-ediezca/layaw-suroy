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

  def tags_count
    @tags.count > 6
  end

  def check_tag_creator_views(tag)
    tag.user == current_user
  end

  def count_image(image)
    image.blog_image.count > 1
  end
  
end
