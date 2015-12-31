class AppController < ApplicationController
    before_action :authenticate_staff!

    def home
    end

    def search_ssn
        @patient = Patient.find_by_ssn params[:ssn] 
        if @patient == nil
            flash[:alert] = "No Patient with this SSN"
            redirect_to root_path
        else
            redirect_to @patient
        end
    end

    def reset
        reset_session
        # render nothing: true
        redirect_to root_path 
    end
end
