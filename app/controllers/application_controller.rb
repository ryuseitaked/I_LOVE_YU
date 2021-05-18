class ApplicationController < ActionController::Base

  before_action :configer_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(recource)
    articles_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configer_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:telephone_number])
  end

end
