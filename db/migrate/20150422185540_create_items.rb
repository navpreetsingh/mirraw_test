class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :order, index: true
      t.string :product_name
      t.integer :quantity
      t.float :rate
      t.boolean :received, default: false

      t.timestamps null: false
    end
  end
end
