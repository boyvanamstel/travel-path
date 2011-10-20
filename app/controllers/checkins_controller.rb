class CheckinsController < ApplicationController
  before_filter :authenticate_user!

  def recent 
    @checkins = foursquare_client.user_checkins({:limit => 100})

    respond_to do |format|
      format.json  { render :json => @checkins }
    end
  end

end
