class SetupInitialSchema < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string  :name
      t.integer :tier
      t.string  :location
    end

    create_table :items do |t|
      t.string    :name
      t.string    :description
      t.integer   :price,        default: 0
      t.integer   :merchant_id,  null: false
      t.datetime  :receive_date
      t.datetime  :sell_date
      t.datetime  :ship_date
    end

    create_table :item_to_characteristics do |t|
      t.integer :item_id
      t.integer :characteristic_id
    end

    create_table :characteristic_types do |t|
      t.string :name
    end

    create_table :characteristics do |t|
      t.integer :characteristic_type_id
      t.string  :name
    end
  end
end
