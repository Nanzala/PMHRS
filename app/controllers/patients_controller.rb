class PatientsController < ApplicationController
    before_action :authenticate_staff!
    before_action :set_hospital_id

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
        @records = Record.where("patient_id = ? and id in (select record_id from permissions where hospital_id = ?)",@patient.id , @hospital_id)
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

    private
    def patient_params
        params.require(:patient).permit(
            :ssn,
            :name,
            :gender,
            :date_of_birth,
            :phone,
            :email,
            :next_of_kin,
            :next_of_kin_contact 
        )
    end

    def set_hospital_id
    @hospital_id = session[:hospital_id]
    end
end
