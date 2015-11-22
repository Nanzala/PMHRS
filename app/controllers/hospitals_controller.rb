class HospitalsController < ApplicationController
  
  def new
	@hospital = Hospital.new
  end

  def create
	@hospital = Hospital.new(hospital_params)
	@hospital.save
	render text: "Successfully saved!!!"

  end

  def hospital_params
  	params.require(:hospital).permit(:id,
  									 :name,
  									 :location,
  									 :level,
  									 :address)
  end

  def show
  end

end
