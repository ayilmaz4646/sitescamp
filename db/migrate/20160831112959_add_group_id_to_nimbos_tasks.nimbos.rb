# This migration comes from nimbos (originally 20160322153537)
class AddGroupIdToNimbosTasks < ActiveRecord::Migration
  def change
  	change_table :nimbos_tasks do |t|
  		t.integer  :group_id
  	end
  end
end
