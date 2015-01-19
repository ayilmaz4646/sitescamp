# This migration comes from nimbos (originally 20140801121043)
class AddIndexesToNimbosGroups < ActiveRecord::Migration
  def change
  	add_index :nimbos_groups, :patron_id
  end
end
