# This migration comes from feeder (originally 20150115110106)
class CreateFeederSitesFeeds < ActiveRecord::Migration
  def change
    create_table :feeder_sites_feeds do |t|
    	t.references :site
    	t.references :feed

      t.timestamps
    end
  end
end
