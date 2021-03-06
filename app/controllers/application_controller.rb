class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up).push(:name, :works, :group, :profile, :avatar)
      devise_parameter_sanitizer.for(:account_update).push(:name, :works, :group, :profile, :avatar)
  end

end

