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

    def new_appointment
        @staff = Staff.find params[:staff_id]
        @hospitals = Hospital.all
    end

    def create_appointment
        Staff.find(params[:staff_id]).hospitals << Hospital.find(params[:hospital_id])
        redirect_to staffs_path(params[:staff_id])
    end
    def destroy_appointment
        Staff.find(params[:staff_id]).hospitals.delete(Hospital.find(params[:hospital_id]))
        redirect_to staffs_path(params[:staff_id])
    end

    private
    def update_params
        params.require(:staff).permit(:name, :email, :role, :address, :phone)
    end
end
