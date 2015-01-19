# This migration comes from nimbos (originally 20140801120608)
class AddIndexesToNimbosCounters < ActiveRecord::Migration
  def change
  	add_index :nimbos_counters, :patron_id
  end
end
