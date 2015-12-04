require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    #
    def setup 
        @p = Patient.new(name:'Sam Curtis', ssn: '12345abcde', gender: 'male', phone: '123456789123', next_of_kin: "Mothere", next_of_kin_contact: '123456789abcde')

    @record = Record.new(hospital_id: '1', staff_id: '1', height: nil, weight: nil, temperature: nil, blood_pressure: nil, symptoms: nil, diagnosis: nil, patient_id: 1)
  end
    test "invalid patient id with date of birt" do
        assert_not @p.valid?
    end

  test "valid record" do
    assert @record.valid?
  end
    test "valid patient id with date of birth 17 yrs ago" do
        @p.date_of_birth = 17.years.ago
        assert @p.valid?
    end

  test "hospital not blank" do
    @record.hospital_id = nil
    assert_not @record.valid?
  end
    test "invalid patient with date of birth 15 yrs ago" do
        @p.date_of_birth = 15.years.ago
        assert_not @p.valid?
    end

  test "staff id not blank" do
    @record.staff_id = nil
    assert_not @record.valid?
  end
    test "valid patient with date of birth 15 yrs ago" do
        @p.date_of_birth = 15.years.ago
        @p.parent_ssn = '1234abcd'
        assert @p.valid?
    end

  test "patient id not blank" do
    @record.patient_id = nil
    assert_not @record.valid?
  end
end
