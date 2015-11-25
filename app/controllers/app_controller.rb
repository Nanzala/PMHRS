class AppController < ApplicationController

    def home

    end

    def search_ssn
        @patient = Patient.find_by_ssn params[:ssn] 
        redirect_to @patient
    end
end
