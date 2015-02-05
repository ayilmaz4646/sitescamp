namespace :feeder do
desc 'Check feed sources for new posts'
 task :feed_checker => [:environment] do
 	  @feed_sources = Feeder::FeedSource.all
    @feed_sources.each do |feed_source|
    	feed_source.get_feed_entries
   	end
  end
end