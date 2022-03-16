class ApplicationController < ActionController::Base
  include ActionController::Helpers
  
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
end
