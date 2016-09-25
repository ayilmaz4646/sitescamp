# This migration comes from nimbos (originally 20160615064221)
class RenameCityToCitynameForNimbosBranches < ActiveRecord::Migration
  def change
  	change_table :nimbos_branches do |t|
  	  t.rename   :city, :city_name
  	end
  end
end
