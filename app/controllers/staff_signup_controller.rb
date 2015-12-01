class StaffSignupController < ApplicationController
    before_action :authenticate_admin!
    def new
        @staff = StaffSignup.new   
    end

    def create
        @staff = StaffSignup.new(staff_params)

        if @staff.save
            flash[:notice] = "Staff Registered Successfully"
            redirect_to system_path
        else
            flash.now[:alert] = "Error! Staff not registered"
            render 'new'
        end
    end

    def show
        @staff = StaffSignup.find(params[:id])
    end

    def edit
        @staff = StaffSignup.find(params[:id])
        render 'new'
    end

    def update
        @staff = StaffSignup.find(params[:id])

        if @staff.update(staff_params)
            flash[:notice] = "Staff updated successfully"
            redirect_to @staff
        else
            flash.now[:alert] = "Staff not updated"
            render 'new'
        end
    end

    def staff_applications
        @staffs_signups = StaffSignup.all 
    end
    private
    def staff_params
        params.require(:staff_signup).permit(
            :email,
            :valid_until
        )
    end 
end
