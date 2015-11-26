require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "correct patient" do
    @patient = Patient.new(name: 'test patient', gender: 'female', date_of_birth: '12-12-2012', phone: '0201234567', email: 'patient@mail.com', next_of_kin: 'parent', next_of_kin_contact: '0201234132', ssn: '123123123')
    @patient.save
    assert @patient.valid?
  end
end
