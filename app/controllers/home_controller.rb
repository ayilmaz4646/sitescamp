class HomeController < ApplicationController

  layout "homepage"

  def index
  	@feeds = Feeder::Feed.order(created_at: :desc).limit(9)
  	@sites = Feeder::Site.order(created_at: :desc).limit(8)
  	@feed_sources = Feeder::FeedSource.order(created_at: :desc).limit(8)
  	#@channels = Channel.order(created_at: :desc).limit(7)
  end

end
