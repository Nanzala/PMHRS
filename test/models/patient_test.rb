require 'test_helper'

class PatientTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end

    def setup 
        @p = Patient.new name:'Sam Curtis', ssn: '12345abcde', gender: 'male', phone: '123456789123', next_of_kin: "Mothere", next_of_kin_contact: '123456789abcde'
    end

    test "invalid patient id with date of birt" do
        assert_not @p.valid?
    end

    test "valid patient id with date of birth 17 yrs ago" do
        @p.date_of_birth = 17.years.ago
        assert @p.valid?
    end

    test "invalid patient with date of birth 15 yrs ago" do
        @p.date_of_birth = 15.years.ago
        assert_not @p.valid?
    end

    test "valid patient with date of birth 15 yrs ago" do
        @p.date_of_birth = 15.years.ago
        @p.parent_ssn = '1234abcd'
        assert @p.valid?
    end
end
