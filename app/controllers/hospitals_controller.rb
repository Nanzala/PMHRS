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
    render 'new'
  end

  end

  def hospital_params
  	params.require(:hospital).permit(:name,
  									                 :location,
  									                 :level,
  									                 :address)
  end

  def show
    @hospital = Hospital.find(params[:id])
  end

end
