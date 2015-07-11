namespace :files do
  desc "Send yml files"
  task :send do
    on roles(:app), in: :sequence do
    	upload! "config/database.yml", "#{fetch(:deploy_to)}/shared/config/database.yml"
			upload! "config/cloudinary.yml", "#{fetch(:deploy_to)}/shared/config/cloudinary.yml"
			upload! "config/resque.yml", "#{fetch(:deploy_to)}/shared/config/resque.yml"
			upload! "config/secrets.yml", "#{fetch(:deploy_to)}/shared/config/secrets.yml"
	  end
  end
end