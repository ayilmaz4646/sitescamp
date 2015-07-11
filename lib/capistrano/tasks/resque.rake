namespace :resque do

	#task :start, roles: :web do
  #  desc "starting resque for #{application}"
  #  run "#{sudo} nohup bundle exec rake environment resque:work RAILS_ENV=production QUEUE=* VERBOSE=1 PIDFILE=tmp/pids/resque_worker_QUEUE.pid >> #{current_path}/log/resque_worker_QUEUE.log 2>&1"
	#end

  task :start do
    on roles(:web), in: :sequence do
      desc "starting resque for #{application}"
      run "cd #{current_path}"
      run "RAILS_ENV=production QUEUE=* nohup rake resque:work"
      exit
    end
  end

  task :stop do
    on roles(:web), in: :sequence do
      desc "stoping resque for #{application}"
      run "#{sudo} kill -9 $(cat tmp/pids/resque_worker_QUEUE.pid)"
      run "#{sudo} rm -f tmp/pids/resque_worker_QUEUE.pid"
      exit
    end
  end

  def run_remote_rake(rake_cmd)
    rake_args = ENV['RAKE_ARGS'].to_s.split(',')
    cmd = "cd #{fetch(:latest_release)} && #{fetch(:rake, "rake")} RAILS_ENV=#{fetch(:rails_env, "production")} #{rake_cmd}"
    cmd += "['#{rake_args.join("','")}']" unless rake_args.empty?
    run cmd
    set :rakefile, nil if exists?(:rakefile)
  end

  task :restart_workers do
    on roles(:db), in: :sequence do
      desc "Restarting Resque Workers"
      run_remote_rake "resque:restart_workers"
    end
  end

  task :restart_scheduler do
    on roles(:db), in: :sequence do
      desc "Restarting Resque scheduler"
      run_remote_rake "resque:restart_scheduler"
    end
  end

end