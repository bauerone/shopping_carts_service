class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :product_id
      t.string :integer
      t.references :shopping_cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
