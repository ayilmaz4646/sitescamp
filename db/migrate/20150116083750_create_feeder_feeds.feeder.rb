# This migration comes from feeder (originally 20141109143417)
class CreateFeederFeeds < ActiveRecord::Migration
  def change
    create_table :feeder_feeds do |t|
      t.string  :title,    null: false
      t.text    :content
      t.string  :url
      t.boolean :analyzed, default: false
      t.string  :language, default: false
      t.integer :feed_source_id
      t.string  :entry_id
      
      t.timestamps
    end
    add_index :feeder_feeds, [:entry_id, :feed_source_id], unique: true
  end
end
