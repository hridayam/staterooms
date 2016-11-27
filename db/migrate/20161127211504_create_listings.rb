class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.decimal :price, precision: 10, scale: 2
      t.string :title
      t.text :address
      t.text :description

      t.timestamps
    end
  end
end
