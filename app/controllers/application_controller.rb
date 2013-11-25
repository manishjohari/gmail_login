class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_user
  	if !current_user
  		redirect_to home_index_path
  		return
  	end
  end

end
