# This migration comes from feeder (originally 20150212132145)
class AddImageUrlToFeederSites < ActiveRecord::Migration
  def change
    add_column :feeder_sites, :image_url, :string
  end
end
