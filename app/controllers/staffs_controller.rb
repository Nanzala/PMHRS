class StaffsController < ApplicationController
    def new
        @staff = Staff.new   
    end

    def create
        @staff = Staff.new(staff_params)

        unless @staff.save
            render 'show'
        end
    end

    def staff_params
        params.require(:staff).permit(
            :name,
            :role,
            :address,
            :phone
        )
    end 

    def show
    end

end
