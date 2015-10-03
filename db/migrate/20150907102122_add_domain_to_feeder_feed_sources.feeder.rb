# This migration comes from feeder (originally 20150907101830)
class AddDomainToFeederFeedSources < ActiveRecord::Migration
  def change
  	change_table :feeder_feed_sources do |t|
  		t.string   :domain_name
  	end
  end
end
