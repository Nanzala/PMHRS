require 'test_helper'

class PatientTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end

    def setup 
        @p = Patient.new name:'Sam Curtis', ssn: '12345abcde', gender: 'male', phone: '123456789123', next_of_kin: "Mothere", next_of_kin_contact: '123456789abcde'
        @patient = Patient.new(name: 'test patient', gender: 'female', date_of_birth: '12-12-2012', phone: '0201234567', email: 'patient@mail.com', next_of_kin: 'parent', next_of_kin_contact: '0201234132', ssn: '123123123')
    end

    test "invalid patient id with date of birt" do
        assert_not @p.valid?
    end
    test "valid register patient" do    
        assert @patient.valid?
    end
  test "valid register patient" do    
    assert @patient.valid?
  end
  test "valid register adult patient" do    
    assert @patient.valid?
  end

    test "valid patient id with date of birth 17 yrs ago" do
        @p.date_of_birth = 17.years.ago
        assert @p.valid?
    end
    test "patient name not blank" do
        @patient.name = ' '
        assert_not @patient.valid?
    end
  test "valid register child patient" do    
    @patient.date_of_birth = '12-12-2010'
    assert_not @patient.valid?
  end

  test "patient name not blank" do
    @patient.name = ' '
    assert_not @patient.valid?
  end

    test "invalid patient with date of birth 15 yrs ago" do
        @p.date_of_birth = 15.years.ago
        assert_not @p.valid?
    end
    test "ssn not blank" do
        @patient.ssn = ' '
        assert_not @patient.valid?
    end

    test "valid patient with date of birth 15 yrs ago" do
        @p.date_of_birth = 15.years.ago
        @p.parent_ssn = '1234abcd'
        assert @p.valid?
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
