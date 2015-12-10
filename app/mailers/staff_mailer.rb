class StaffMailer < ApplicationMailer
    def signup_email(staff_applicant)
        @applicant = staff_applicant
        mail(to: @applicant.email, subject: 'PMHRS Registration details')
    end
end
