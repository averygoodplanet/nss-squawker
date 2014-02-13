class AddLatitudeAndLongitudeToSqueek < ActiveRecord::Migration
  def change
    add_column :squeeks, :latitude, :float
    add_column :squeeks, :longitude, :float
  end
end
