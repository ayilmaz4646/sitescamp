# This migration comes from feeder (originally 20150307185414)
class CreateFeederReadlaters < ActiveRecord::Migration
  def change
    create_table :feeder_readlaters do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
