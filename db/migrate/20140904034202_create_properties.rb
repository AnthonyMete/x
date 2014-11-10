class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :line_1, :limit => 30
      t.string :line_2, :limit => 30
      t.string :line_3, :limit => 30
      t.string :city, :limit => 50
      t.string :region, :limit => 50
      t.string :country, :limit => 2
      t.string :postal_code, :limit => 20
      t.float :latitude
      t.float :longitude
      t.point :location
      t.string :current_state
      t.timestamps
    end
  end
end
