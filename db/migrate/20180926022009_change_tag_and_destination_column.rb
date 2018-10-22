class ChangeTagAndDestinationColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :tags, :description, :text
    change_column :destinations, :blog_body, :text
  end
end
