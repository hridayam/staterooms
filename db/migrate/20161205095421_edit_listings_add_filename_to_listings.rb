class EditListingsAddFilenameToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :cover_filename, :string
  end
end
