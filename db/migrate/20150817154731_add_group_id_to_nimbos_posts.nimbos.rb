# This migration comes from nimbos (originally 20150810143758)
class AddGroupIdToNimbosPosts < ActiveRecord::Migration
  def change
  	change_table :nimbos_posts do |t|
  		t.integer :group_id
  	end
  end
end