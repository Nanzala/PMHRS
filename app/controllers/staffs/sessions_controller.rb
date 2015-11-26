class Staffs::SessionsController < Devise::SessionsController    
    def create
        @h = Hospital.find_by ref: params[:ref]
        if @h == nil 
            render :text => "No hospital"
            return
        end
        session[:hospital_id] = @h.id
        super
    end

    def destroy
        super
        session[:hospital] = nil
    end
end
