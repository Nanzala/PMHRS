class Staffs::StaffsController < ApplicationController
    def index
        @staffs = Staff.all
    end

    def show
        @staff = Staff.find params[:id]
    end

    def edit
        @staff = Staff.find params[:id]
        render 'edit'
    end

    def update
        @staff = Staff.find params[:id]
        if @staff.update(update_params)
            redirect_to staffs_staffs_path, :flash => { :success => "Profile updated." }
        else
            render 'edit'
        end
    end

    private
    def update_params
        params.require(:staff).permit(:name, :email, :role, :address, :phone)
    end
end
