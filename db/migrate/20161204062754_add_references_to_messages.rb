class AddReferencesToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :sender_id, :integer
    add_column :messages, :recipient_id, :integer

    add_foreign_key :messages, :users, column: :sender_id
    add_foreign_key :messages, :users, column: :recipient_id
  end
end
