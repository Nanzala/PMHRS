class StaffsController < ApplicationController
  def new
    @staff = Staff.new   
  end

  def create
    @staff = Staff.new(staff_params)

      if @staff.save
        flash[:notice] = "Staff Registered Successfully"
        redirect_to @staff
      else
        render 'new'

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
    @staff = Staff.find(params[:id])
  end
    
end
