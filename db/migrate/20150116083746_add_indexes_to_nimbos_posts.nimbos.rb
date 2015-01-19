# This migration comes from nimbos (originally 20140801121451)
class AddIndexesToNimbosPosts < ActiveRecord::Migration
  def change
  	add_index :nimbos_posts, :patron_id
  	add_index :nimbos_posts, :user_id
  	add_index :nimbos_posts, [:target_type, :target_id]
  end
end
