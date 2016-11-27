class AddUserToListing < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :listings, :users
  end
end
