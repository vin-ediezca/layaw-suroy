module CategoriesHelper

  def categories_count
    @categories.count > 6
  end

  def category_tags_count
    @category_tags.count > 12
  end

end
