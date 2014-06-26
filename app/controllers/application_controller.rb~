require 'dm-rails/middleware/identity_map'
class ApplicationController < ActionController::Base
  use Rails::DataMapper::Middleware::IdentityMap
  protect_from_forgery

rescue_from DataObjects::IntegrityError do |excep|
    flash[:error] = excep.message
    redirect_to :back, {error: "You can not do #{excep.message} operation" }
  end
  
 
  enable_authorization do |exception|
    redirect_to root_url, :alert => exception.message
  end unless :devise_controller?
  
  rescue_from CanCan::Unauthorized do |exception|
    # bebugger
    flash[:error] = exception.message
    if user_signed_in?
      # debugger
      redirect_to((request.referer || root_url), {notice: "Sorry you are not authorised to do #{params[:action]} operation." })
    else
      # Adds the protected page to the login url but only if the user is not logged in
      redirect_to new_user_session_path, {notice: "Please Log in"}
    end
  end



end
