class CreateProductTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :product_taggings do |t|

      t.timestamps
      t.references :tag, foreign_key: true
      t.references :product, foreign_key: true
    end
  end
end
