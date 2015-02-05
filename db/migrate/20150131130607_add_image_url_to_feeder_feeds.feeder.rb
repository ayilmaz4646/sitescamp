# This migration comes from feeder (originally 20150131130341)
class AddImageUrlToFeederFeeds < ActiveRecord::Migration
  def change
  	change_table :feeder_feeds do |t|
  		t.string   :image_url, limit: 1000
  	end
  end
end
