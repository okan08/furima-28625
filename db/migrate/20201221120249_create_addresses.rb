class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postnum,         null: false
      t.string :city,            null: false
      t.string :housenum,        null: false
      t.string :building
      t.string :tel,             null: false
      t.references :order,       null: false, foreign_key: true
      t.integer :prefecture_id,  null: false

      t.timestamps
    end
  end
end