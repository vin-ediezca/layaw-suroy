class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :blog_title
      t.string :blog_body
      t.string :created_by
      t.string :last_update_by
      t.references :tag
      t.timestamps
    end
  end
end
