class RecordsController < ApplicationController
    before_action :authenticate_staff!

    def new
        @record = Patient.find_by(params[:id]).records.build
    end

    def create
        @record = Patient.find(params[:patient_id]).records.build(record_params)
        @record.hospital_id = session[:hospital_id]
        @record.staff_id = current_staff.id

        if @record.save
            flash[:notice] = "Patient Record Registered Successfully"
            redirect_to patient_record_path :patient_id => @record.patient_id, :id => @record.id
        else
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
        @record = Record.find(params[:id])

        if @record.update(record_params)
            flash[:notice] = "Patient record updated successfully"
            redirect_to @record
        else
            flash.now[:alert] = "Patient record not updated"
            render 'new'
        end
    end

    private
    def record_params
        params.require(:record).permit(:height,
                                       :weight,
                                       :temperature,
                                       :blood_pressure,
                                       :symptoms,
                                       :diagnosis)
    end
end
