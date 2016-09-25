# This migration comes from nimbos (originally 20160421101652)
class AddRegionToNimbosPatrons < ActiveRecord::Migration
  def change
  	change_table   :nimbos_patrons do |t|
  		t.references :region 
  		t.references :city
  	end
  end
end
