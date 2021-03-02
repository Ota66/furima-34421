class CreateSippings < ActiveRecord::Migration[6.0]
  def change
    create_table :sippings do |t|
      t.string   :postal_code,  null: false
      t.integer   :area_id,     null: false
      t.string   :municipality, null: false
      t.string   :house_number, null: false
      t.string   :building_name
      t.string   :phone_number, null: false
      t.references :buy,        null: false
      t.timestamps
    end
  end
end
