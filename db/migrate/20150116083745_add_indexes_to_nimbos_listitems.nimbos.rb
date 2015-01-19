# This migration comes from nimbos (originally 20140801121212)
class AddIndexesToNimbosListitems < ActiveRecord::Migration
  def change
  	add_index :nimbos_listitems, :listheader_id
  end
end
