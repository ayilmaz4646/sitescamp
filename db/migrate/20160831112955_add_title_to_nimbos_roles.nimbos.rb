# This migration comes from nimbos (originally 20160225074312)
class AddTitleToNimbosRoles < ActiveRecord::Migration
  def change
  	change_table  :nimbos_roles do |t|
  		t.string    :title, limit: 100
  	end
  end
end
