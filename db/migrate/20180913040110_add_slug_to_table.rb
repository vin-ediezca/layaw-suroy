class AddSlugToTable < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :slug, :string
    add_index :tags, :slug, unique: true

    add_column :destinations, :slug, :string
    add_index :destinations, :slug, unique: true

    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
  end
end
