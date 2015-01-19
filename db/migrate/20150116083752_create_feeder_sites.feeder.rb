# This migration comes from feeder (originally 20150114080422)
class CreateFeederSites < ActiveRecord::Migration
  def change
    create_table :feeder_sites do |t|
      t.string   :domain, null: false, limit: 500, index: true
      t.string   :title, limit: 1000
      t.text     :description
      t.text     :keywords

      t.timestamps
    end

  end
end
