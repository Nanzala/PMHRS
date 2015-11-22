class PatientsController < ApplicationController
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    
    if @patient.save
      flash[:notice] = "Patient registered successfully"
      redirect_to @patient
    else
      flash.now[:alert] = "Error! Patient not registered"
      render 'new'
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
    render 'new'
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
     flash[:notice] = "Patient updated successfully"
     redirect_to @patient
   else
     flash.now[:alert] = "Patient not updated"
     render 'new'
   end  
  end

  def patient_params
   params.require(:patient).permit(
    :name,
    :gender,
    :date_of_birth,
    :phone,
    :email,
    :next_of_kin,
    :next_of_kin_contact 
   )
  end
end
