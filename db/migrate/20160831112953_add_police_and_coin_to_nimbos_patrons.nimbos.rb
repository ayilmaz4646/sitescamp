# This migration comes from nimbos (originally 20151116090616)
class AddPoliceAndCoinToNimbosPatrons < ActiveRecord::Migration
  def change
  	change_table :nimbos_patrons do |t|
  		t.integer  :remained_coins, default: 0
  		t.string   :police, limit: 40
  	end
  end
end
