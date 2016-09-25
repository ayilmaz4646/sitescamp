# This migration comes from nimbos (originally 20160322153830)
class AddCountsToNimbosGroups < ActiveRecord::Migration
  def change
  	change_table :nimbos_groups do |t|
  		t.integer  :comments_count, default: 0
  		t.integer  :tasks_count, default: 0
  		t.integer  :reminders_count, default: 0
  	end
  end
end
