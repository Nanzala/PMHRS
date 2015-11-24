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

  private
  def staff_params
    params.require(:staff).permit(
     :name,
     :role,
     :address,
     :phone
    )
  end 
end
