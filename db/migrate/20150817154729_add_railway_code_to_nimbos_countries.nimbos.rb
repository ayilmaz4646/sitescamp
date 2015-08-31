# This migration comes from nimbos (originally 20150702081923)
class AddRailwayCodeToNimbosCountries < ActiveRecord::Migration
  def change
  	change_table :nimbos_countries do |t|
  		t.string   :uic_code, limit: 20
  	end
  end
end
