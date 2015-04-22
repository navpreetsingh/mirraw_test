class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :product_name
      t.integer :quantity
      t.float :rate
      t.boolean :received

      t.timestamps null: false
    end
  end
end
