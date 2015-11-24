class RecordsController < ApplicationController

 def new
 	@record = Record.new
 end

 def create
 	@record = Record.new(record_params)

 	if @record.save
 		flash[:notice] = "Patient Record Registered Successfully"
 		redirect_to @record
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
