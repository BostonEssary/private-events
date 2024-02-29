class ApplicationController < ActionController::Base

    protected

    def configure_permitted_params
        devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name, :last_name])
    end

end
