class Staffs::SessionsController < Devise::SessionsController    

    def create
        @h = Hospital.find_by ref: params[:ref]
        if @h == nil 
            flash[:alert] = "Invalid Hospital id"
            redirect_to new_staff_session_path
        else 
            session[:hospital_id] = @h.id
            super
        end
    end

    def destroy
        super
        session[:hospital] = nil
    end

end
