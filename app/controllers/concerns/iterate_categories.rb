module IterateCategories
  def categories
    @categories = Category.all.take(10)
  end
end