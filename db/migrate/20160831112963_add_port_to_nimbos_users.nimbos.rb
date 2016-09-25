# This migration comes from nimbos (originally 20160329143322)
class AddPortToNimbosUsers < ActiveRecord::Migration
  def change
    change_table :nimbos_users do |t|
      t.boolean  :smtp_enabled, default: false
      t.string   :smtp_address, limit: 100
      t.integer  :smtp_port, default: 587
      t.string   :smtp_domain, limit: 100
      t.string   :smtp_user_name, limit: 100
      t.string   :smtp_user_password, limit: 100
      t.string   :smtp_user_signature, limit: 1000
    end
  end
end
