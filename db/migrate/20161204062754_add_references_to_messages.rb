class AddReferencesToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :sender, :integer
    add_column :messages, :recipient, :integer

    add_foreign_key :messages, :users, column: :sender
    add_foreign_key :messages, :users, column: :recipient
  end
end
