class StaffsController < ApplicationController
    before_action :authenticate_admin!
    def new
        @staff = StaffSignup.new   
    end

    def create
        @staff = StaffSignup.new(staff_params)

        # @staff.confirmation_token = 

        if @staff.save
            flash[:notice] = "Staff Registered Successfully"
            redirect_to system_path
        else
            flash.now[:alert] = "Error! Staff not registered"
            render 'new'
        end
    end

    def show
        @staff = Staff.find(params[:id])
    end

    def edit
        @staff = Staff.find(params[:id])
        render 'new'
    end

    def update
        @staff = Staff.find(params[:id])

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
