class CreatePropertyDossiers < ActiveRecord::Migration
  def change
    create_table :property_dossiers do |t|
      t.references :property
      t.string :property_type
      t.references :area_unit
      t.decimal :interior_surface
      t.decimal :exterior_surface
      t.decimal :livable_surface
      t.hstore :surface_area_by_room
      t.hstore :surface_area_by_floor
      t.hstore :counts
      t.hstore :rooms
      t.timestamps
    end
  end
end
