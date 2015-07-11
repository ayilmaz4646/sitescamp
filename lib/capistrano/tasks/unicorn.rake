namespace :load do

  task :defaults do

    set :unicorn_default_hooks, ->{ true }

    # If you need a special boot commands
    #
    set :unicorn_cmd,           ->{ "service unicorn"  }
    # set :unicornctl_cmd,        ->{ "bundle exec unicornctl" }
    #set :unicorn_cmd,           ->{  }
    set :unicorn_role,            ->{ :app }

    set :unicorn_user, ->{ user }
    set :unicorn_pid, ->{ "#{current_path}/tmp/pids/unicorn.pid" }
    set :unicorn_config, ->{ "#{shared_path}/config/unicorn.rb" }
    set :unicorn_log, ->{ "#{shared_path}/log/unicorn.log" }
    set :unicorn_workers, ->{ 2 }
  end
end

namespace :unicorn do

  desc "Setup Unicorn initializer and app configuration"
  task :setup do
    on roles(:app), in: :sequence do
      upload! 'lib/capistrano/templates/unicorn.rb.erb', '/tmp/unicorn_config'
      upload! 'lib/capistrano/templates/unicorn_init.erb', '/tmp/unicorn_init'
      execute :chmod, "+x /tmp/unicorn_init"
      execute :mv, "/tmp/unicorn_init /etc/init.d/unicorn_#{fetch(:application)}"
      execute "update-rc.d", "-f unicorn_#{fetch(:application)} defaults"
    end
  end

  %w[start stop restart].each do |command|
    desc "#{command} unicorn"
    task command do
      on roles(:app) do
        run "service unicorn_#{fetch(:application)} #{command}"
      end
    end
  end
end