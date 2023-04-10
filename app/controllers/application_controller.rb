class ApplicationController < ActionController::Base
  #before_action :authenticate_user!, except: [:top,:about]
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    if resource.class == Admin
      admin_root_path
    else
      user_path(current_user)
    end
    #@handlename = current_user.handlename
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      admin_root_path
    else
      root_path
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name,:last_name,:first_name_kana,:last_name_kana,:handlename])
  end
end
