# This migration comes from nimbos (originally 20150713150115)
class AddManagerIdToNimbosUser < ActiveRecord::Migration
  def change
  	change_table :nimbos_users do |t|
  		t.references :manager
  	end
  end
end
