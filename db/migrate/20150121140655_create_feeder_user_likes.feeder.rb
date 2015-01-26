# This migration comes from feeder (originally 20150121140557)
class CreateFeederUserLikes < ActiveRecord::Migration
  def change
    create_table :feeder_user_likes do |t|
      t.references :feed
      t.references :user

      t.timestamps
    end
  end
end
