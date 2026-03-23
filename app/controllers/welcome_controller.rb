class WelcomeController < ApplicationController
  allow_unauthenticated_access
  
  def index
    redirect_to timeline_path if authenticated?
  end
end
