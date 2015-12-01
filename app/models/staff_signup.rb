class StaffSignup < ActiveRecord::Base
    validate :staff_exists?

    def staff_exists?
          return false if Staff.find_by(email: self.email).nil?
    end
end
