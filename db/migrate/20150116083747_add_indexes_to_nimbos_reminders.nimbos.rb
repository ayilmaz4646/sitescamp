# This migration comes from nimbos (originally 20140801121715)
class AddIndexesToNimbosReminders < ActiveRecord::Migration
  def change
  	add_index :nimbos_reminders, :patron_id
  	add_index :nimbos_reminders, [:remindfor_type, :remindfor_id]
  end
end
