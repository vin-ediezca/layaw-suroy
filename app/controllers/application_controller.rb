class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user
  helper_method :categories

  include AuthenticateUser
  include IterateCategories
end
