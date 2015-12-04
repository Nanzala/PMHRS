class DashboardController < ApplicationController
    before_action :authenticate_admin!
    def home
    end
end
