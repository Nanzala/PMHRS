class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    def raise_404(string="Not found")
        raise ActionController::RoutingError.new(string)
    end
end
