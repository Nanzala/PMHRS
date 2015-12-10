require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @record = Record.new( staff_id: "657b2a62-2973-41fa-9a24-945612643358", height: 165, weight: 54, temperature: 38, blood_pressure: "117/90", symptoms: "Fever, Rashes", diagnosis: "Heat Exposure", patient_id: "7d31fcfd-775c-4420-a274-3183ec4911a5")

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

  test "patient height not blank" do
    @record.height = nil
    assert_not @record.valid?
  end

  test "patient weight not blank" do
    @record.weight = nil
    assert_not @record.valid?
  end

  test "patient temperature not blank" do
    @record.temperature = nil
    assert_not @record.valid?
  end

  test "patient height not zero" do
    @record.height = 0
    assert_not @record.valid?
  end

  test "patient height is less than 240cm" do
    @record.height = 240
    assert_not @record.valid?
  end

  test "patient weight not zero" do
    @record.weight = 0
    assert_not @record.valid?
  end

  test "patient id exists in the system" do
    @record.patient_id = 3
    assert_not @record.valid?
  end
end
