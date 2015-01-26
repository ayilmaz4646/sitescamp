# This migration comes from feeder (originally 20150124093643)
class CreateFeederFeedErrors < ActiveRecord::Migration
  def change
    create_table   :feeder_feed_errors do |t|
      t.references :feed_source, index: true, null: false
      t.text       :feed_param
      t.text       :error_message
      t.string     :error_type, limit: 255

      t.timestamps
    end
  end
end
