# This migration comes from feeder (originally 20150128145420)
class AddAuthorPublishedAtLikesCountToFeederFeeds < ActiveRecord::Migration
  def change
    add_column :feeder_feeds, :author, :string
    add_column :feeder_feeds, :published_at, :date
    add_column :feeder_feeds, :likes_count, :integer
  end
end
