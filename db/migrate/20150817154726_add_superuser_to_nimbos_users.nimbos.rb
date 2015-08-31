# This migration comes from nimbos (originally 20141212080019)
class AddSuperuserToNimbosUsers < ActiveRecord::Migration
  def change
  	change_table :nimbos_users do |t|
  		t.boolean  :rootuser, default: false, null: false
  		t.boolean  :authorized, default: true, null: false
  	end
  end
end
