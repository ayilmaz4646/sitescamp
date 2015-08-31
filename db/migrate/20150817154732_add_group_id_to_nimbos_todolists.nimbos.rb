# This migration comes from nimbos (originally 20150811115720)
class AddGroupIdToNimbosTodolists < ActiveRecord::Migration
  def change
  	change_table :nimbos_todolists do |t|
  		t.integer :group_id
  		t.boolean :isdefault, default: false
  	end
  end
end
