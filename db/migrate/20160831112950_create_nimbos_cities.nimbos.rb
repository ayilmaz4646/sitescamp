# This migration comes from nimbos (originally 20151008080601)
class CreateNimbosCities < ActiveRecord::Migration
  def change
    create_table :nimbos_cities do |t|
      t.string     :code
      t.string     :name, null: false
      t.string     :tel_code
      t.string     :country_id, index: true, limit: 2, null: false

      t.timestamps null: false
    end
  end
end
