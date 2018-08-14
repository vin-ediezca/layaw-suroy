class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :title
      t.string :description
      t.string :map_embed
      t.timestamps
    end
  end
end
