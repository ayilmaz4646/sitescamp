# This migration comes from nimbos (originally 20160422062329)
class CreateNimbosRegions < ActiveRecord::Migration
  def change
    create_table :nimbos_regions do |t|
      t.string   :name, null: false, limit: 100
      t.references :city, index: true
      t.string   :country_id, index: true, limit: 2

      t.timestamps null: false
    end
  end
end