namespace :redis do

  desc "Install latest stable version of redis"
  task :install do
    on roles(:web), in: :sequence do
      #add_apt_repository("ppa:rwky/redis")
      sudo "add-apt-repository",  "ppa:rwky/redis"
    	sudo "apt-get", "-y update"
    	sudo "apt-get", "-y install redis-server"
    end
  end
  #after "deploy:install", "redis:install"

	task :start do
    on roles(:web) do
      desc "starting redis-server for #{fetch(:application)}"
      sudo "service redis-server", "start"
    end
	end

  task :stop do
    on roles(:web) do
      desc "disabling redis-server for #{fetch(:application)}"
      sudo "update-rc.d", "redis-server disable"
    end
  end

end