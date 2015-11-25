class Staffs::RegistrationsController < Devise::RegistrationsController
    private

    def sign_up_params
        params.require(:staff).permit(:ssn, :email, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:staff).permit(:name, :email, :password, :password_confirmation, :current_password)
    end

end
