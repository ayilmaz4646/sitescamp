# This migration comes from nimbos (originally 20140801122312)
class AddIndexesToNimbosTodolists < ActiveRecord::Migration
  def change
  	add_index :nimbos_todolists, :patron_id
  	add_index :nimbos_todolists, [:todop_type, :todop_id]
  end
end
