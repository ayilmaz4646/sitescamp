# This migration comes from nimbos (originally 20160502073107)
class AddBrokerIdToNimbosPatrons < ActiveRecord::Migration
  def change
    change_table :nimbos_patrons do |t|
      t.references :broker
    end
  end
end
