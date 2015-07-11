namespace :load do

  task :defaults do

    set :nginx_default_hooks, ->{ true }

    # If you need a special boot commands
    #
    set :nginx_cmd,           ->{ "service nginx"  }
    # set :nginxctl_cmd,        ->{ "bundle exec nginxctl" }
    #set :nginx_cmd,           ->{  }
    set :nginx_role,            ->{ :app }

  end
end

namespace :nginx do

  desc "Install latest stable version of nginx"
  task :install do
    on roles(:web), in: :sequence do
      #add_apt_repository("ppa:nginx/stable")
      run "add-apt-repository",  "ppa:nginx/stable"
      execute "apt-get", "-y update"
      execute "apt-get", "-y install nginx"
    end
  end

  desc "Setup nginx configuration for this application"
  task :setup do
    on roles(:web), in: :sequence do
      #template "nginx_unicorn.erb", "/tmp/nginx_conf"
      upload! "lib/capistrano/templates/nginx_unicorn.erb", "/tmp/nginx_conf"
      execute :mv, "/tmp/nginx_conf /etc/nginx/sites-enabled/#{fetch(:application)}"
      execute :rm, "-f /etc/nginx/sites-enabled/default"
    end
  end

	%w[start stop restart].each do |command|
		desc "#{fetch(:command)}ing nginx for #{fetch(:application)}"
		task command do
      on roles(:web), in: :sequence do
		  	#execute "service nginx #{fetch(:command)}"
        sudo fetch(:nginx_cmd), "#{command}"
      end
		end
	end

  if fetch(:nginx_default_hooks)
    after 'deploy:finished', 'nginx:restart'
    after 'nginx:setup', 'nginx:restart'
  end

end