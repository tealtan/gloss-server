class User::ParameterSanitizer < Devise::ParameterSanitizer
    private
    def sign_up
      default_params.permit(:username, :email, :password)
    end

    def account_update
      default_params.permit(:username, :email, :password, :password_confirmation, :current_password)
    end
end