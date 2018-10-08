class RemoveCreatedByAndLastUpdatedByFromDestinations < ActiveRecord::Migration[5.2]
  def change
  	remove_column :destinations, :created_by, :string
  	remove_column :destinations, :last_update_by, :string
  end
end
