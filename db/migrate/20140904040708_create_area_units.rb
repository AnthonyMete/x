class CreateAreaUnits < ActiveRecord::Migration
  def change
    create_table :area_units do |t|
      t.string :name
      t.hstore :label
      t.decimal :squared_metres_normalization_factor
      t.timestamps
    end
  end
end
