class Staffs::StaffsController < ApplicationController
    def index
        @staffs = Staff.all
    end

    def show
        @staff = Staff.find params[:id]
    end
end
