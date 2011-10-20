class TipsController < ApplicationController
  before_filter :authenticate_user!

  def user 
    @tips = foursquare_client.user_tips(params[:id], {:limit => 100})
    
    respond_to do |format|
      format.json  { render :json => @tips }
    end
  end


end
