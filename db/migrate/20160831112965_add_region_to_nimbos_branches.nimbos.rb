# This migration comes from nimbos (originally 20160421104916)
class AddRegionToNimbosBranches < ActiveRecord::Migration
  def change
  	change_table   :nimbos_branches do |t|
  		t.references :region
  		t.references :city
  	end
  end
end
