class Staffs::RegistrationsController < Devise::RegistrationsController

    def new
        validate_signup
        build_resource({})
        set_minimum_password_length
        yield resource if block_given?
        self.resource.email = params[:email]
        respond_with self.resource
    end


    # POST /resource
    def create
        build_resource(sign_up_params)

        new_staff = StaffSignup.find_by token: params[:token]
        resource.email = new_staff.email  
        resource.save
        new_staff.activated = true
        new_staff.save
        yield resource if block_given?
        raise_404 'staff nill' if new_staff.nil?
        if resource.persisted?
            if resource.active_for_authentication?
                set_flash_message :notice, :signed_up if is_flashing_format?
                # sign_up(resource_name, resource)
                respond_with resource, location: after_sign_up_path_for(resource)
            else
                set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
                expire_data_after_sign_in!
                respond_with resource, location: after_inactive_sign_up_path_for(resource)
            end
        else
            clean_up_passwords resource
            set_minimum_password_length
            respond_with resource
        end
    end

    private
    def after_sign_up_path_for(resource)
        system_path
    end

    def sign_up_params
        params.require(:staff).permit(:ssn, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:staff).permit(:name, :email, :password, :password_confirmation, :current_password)
    end

    def validate_signup
        raise_404 if params[:email].nil? && params[:token].nil?

        email = params[:email]
        @token = params[:token]

        new_staff = StaffSignup.find_by email: email
        raise_404 if new_staff.nil?
        if @token == new_staff.token && !new_staff.activated
            return
        else
            raise_404 'Invalid token or token has expired'
        end
    end
end
