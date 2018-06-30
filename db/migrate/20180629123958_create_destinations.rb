class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :description
      t.string :blog_title
      t.string :blog
      t.string :created_by
      t.string :last_update_by
      t.references :tag
      t.timestamps
    end
  end
end
