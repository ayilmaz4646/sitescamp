# Resque tasks
# require 'resque/tasks'
# require 'resque/scheduler/tasks'

# namespace :resque do
# 	task :setup => :environment do
# 	  ENV['QUEUE'] = '*'
# 	end

# 	task :setup_schedule => :setup do
# 	  require 'resque-scheduler'

# 	  rails_root = Rails.root || File.dirname(__FILE__) + '/../..'
# 	  Resque.schedule = YAML.load_file(rails_root.to_s + '/config/resque_schedule.yml')

# 	  #require 'jobs'
# 	end

# 	task :scheduler => :setup_schedule
# end