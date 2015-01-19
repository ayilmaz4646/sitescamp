# This migration comes from nimbos (originally 20140801120856)
class AddIndexesToNimbosDiscussions < ActiveRecord::Migration
  def change
  	add_index :nimbos_discussions, :patron_id
  	add_index :nimbos_discussions, [:target_type, :target_id]
  end
end
