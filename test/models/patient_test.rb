require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @patient = Patient.new(name: 'test patient', gender: 'female', date_of_birth: '12-12-2012', phone: '0201234567', email: 'patient@mail.com', next_of_kin: 'parent', next_of_kin_contact: '0201234132', ssn: '123123123')
  end

  test "valid register patient" do    
    assert @patient.valid?
  end

  test "patient name not blank" do
    @patient.name = ' '
    assert_not @patient.valid?
  end

  test "ssn not blank" do
    @patient.ssn = ' '
    assert_not @patient.valid?
  end

  test "gender not blank" do
    @patient.gender = ' '
    assert_not @patient.valid?
  end

  test "DOB not blank" do
    @patient.date_of_birth = ' '
    assert_not @patient.valid?
  end

  test "phone number not blank" do
    @patient.phone = ' '
    assert_not @patient.valid?
  end

  test "phone number length min 10" do
    @patient.phone = '123123123'
    assert_not @patient.valid?
  end

  test "phone number length max 12" do
    @patient.phone = '1231231231231'
    assert_not @patient.valid?
  end

  test "next of kin not blank" do
    @patient.next_of_kin = ' '
    assert_not @patient.valid?
  end

  test "next of kin contact not blank" do
    @patient.next_of_kin_contact = ' '
    assert_not @patient.valid?
  end

  test "next of kin contact length min 10" do
    @patient.next_of_kin_contact = '123123123'
    assert_not @patient.valid?
  end

  test "next of kin contact length max 12" do
    @patient.next_of_kin_contact = '1231231231231'
    assert_not @patient.valid?
  end
end
