class HospitalsController < ApplicationController
    before_action :authenticate_admin!
    def new
        @hospital = Hospital.new
    end

    def index
        @hospitals = Hospital.all
    end

    def create
        @hospital = Hospital.new(hospital_params)


        @hospital.ref = generate_ref

        if @hospital.save
            flash[:notice] = "Hospital Registered Successfully"
            redirect_to @hospital
        else
            flash.now[:alert] = "Hospital not registered"
            render 'new'
        end
    end

    def show
        @hospital = Hospital.find(params[:id])
    end

    def edit
        @hospital = Hospital.find(params[:id])
        render 'new'
    end

    def destroy
        Hospital.destroy params[:id]
        redirect_to hospitals_path
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
    def generate_ref
        r = Random.new
        ref = r.rand 10000..99999
        while  Hospital.exists?(:ref => ref) do
            ref = r.rand 10000..99999
        end
        return ref
    end

end
