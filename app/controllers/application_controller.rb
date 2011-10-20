class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :foursquare_client

  # Return the Foursquare_V2 client
  def foursquare_client 
    @foursquare_client ||= Foursquare2::Client.new(:oauth_token => current_user.authentications.find_all_by_provider('foursquare').last.token)    
  end
  
end
