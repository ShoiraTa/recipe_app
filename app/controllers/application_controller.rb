class ApplicationController < ActionController::Base
  include ActionController::Helpers

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  # Overwriting the sign_out redirect path method
  def after_sign_up_path_for(_resource_or_scope)
    new_user_session
  end
end
