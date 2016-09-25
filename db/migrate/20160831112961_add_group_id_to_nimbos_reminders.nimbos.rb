# This migration comes from nimbos (originally 20160322153738)
class AddGroupIdToNimbosReminders < ActiveRecord::Migration
  def change
  	change_table :nimbos_reminders do |t|
  		t.integer  :group_id
  	end
  end
end
