# This migration comes from nimbos (originally 20140714153815)
class AddGuestUserToUsers < ActiveRecord::Migration
  def change
  	change_table :nimbos_users do |t|
  		t.boolean  :is_guest, default: false
  	end
  end
end
