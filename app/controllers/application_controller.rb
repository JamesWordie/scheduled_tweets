class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id]) # use find_by so that it doesn't throw an error if no user_id exists
    end
  end
end
