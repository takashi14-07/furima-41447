class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references     :order       , null: false, foreign_key: true
      t.string         :postal_code   , null: false
      t.integer        :shipping_from_id            , null: false
      t.string         :city           , null: false
      t.string         :address_line1  ,null: false
      t.string         :address_line2    
      t.string         :phone_number           , null: false
      t.timestamps
    end
  end
end
