# This migration comes from nimbos (originally 20160225090117)
class AddDemoToNimbosPatrons < ActiveRecord::Migration
  def change
  	change_table  :nimbos_patrons do |t|
  		t.boolean   :demo, default: false
  	end
  end
end
