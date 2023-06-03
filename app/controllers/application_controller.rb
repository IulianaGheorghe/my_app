class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
  
    private
      def check_admin
        if current_user.role != 'admin'
          redirect_to root_path
          return
        end
      end
  
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :first_name, :last_name, :phone_number, :password, :password_confirmation)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :first_name, :last_name, :phone_number, :password, :current_password, :password_confirmation)}
      end

end