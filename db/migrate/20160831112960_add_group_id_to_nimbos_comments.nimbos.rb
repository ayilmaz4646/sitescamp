# This migration comes from nimbos (originally 20160322153705)
class AddGroupIdToNimbosComments < ActiveRecord::Migration
  def change
  	change_table :nimbos_comments do |t|
  		t.integer :group_id
  	end
  end
end
