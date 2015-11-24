class HospitalsController < ApplicationController
  def new
	  @hospital = Hospital.new
  end

  def create
	  @hospital = Hospital.new(hospital_params)
	
    if @hospital.save
      flash[:notice] = "Hospital Registered Successfully"
      redirect_to @hospital
    else
      flash.now[:alert] = "Hospital not registered"
      render 'new'
    end
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
    render 'new'
  end

  def update
    @hospital = Hospital.find(params[:id])
     
    if @hospital.update(hospital_params)
      flash[:notice] = "Hospital updated successfully"
      redirect_to @hospital
    else
      flash.now[:alert] = "Hospital not updated"
      render 'new'
    end
  end

  private
   def hospital_params
    params.require(:hospital).permit(
    :name,
    :location,
    :level,
    :address
    )
  end
end
