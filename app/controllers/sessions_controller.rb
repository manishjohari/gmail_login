class SessionsController < Devise::SessionsController

	def create
     resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
     respond_with resource, :location => home_index_path
   end
end