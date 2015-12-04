class MedicationsController < ApplicationController
	before_action :authenticate_staff!

	def new
		@medication = Medication.new
	end

	def create
		@medication = Medication.new(medication_params)

		if @medication.save
			flash[:notice] = "Medication registered successfully"
			redirect_to @medication
		else
			flash.now[:alert] = "Error! Patient medication not registered"
			render 'new'
		end
	end

	def show
		@medication = Medication.find(params[:id])
	end

	def edit
        @medication = Medication.find(params[:id])
        render 'new'
    end

    def update
        @medication = Medication.find(params[:id])

        if @medication.update(medication_params)
            flash[:notice] = "Patient medication updated successfully"
            redirect_to @medication
        else
            flash.now[:alert] = "Patient medication not updated"
            render 'new'
        end
    end

    private
    def medication_params
        params.require(:medication).permit(:medication)
    end
end
