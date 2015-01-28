class HomeController < ApplicationController
  layout "homepage"

  def index

  	if current_user && !current_user.is_guest
  		render "dashboard", layout: "application"
  	else
  		render "homepage", layout: "homepage"
  	end
  end
end
