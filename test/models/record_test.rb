require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @record = Record.new(hospital_id: '1', staff_id: '1', height: nil, weight: nil, temperature: nil, blood_pressure: nil, symptoms: nil, diagnosis: nil, patient_id: 1)
  end

  test "valid record" do
    assert @record.valid?
  end

  test "hospital not blank" do
    @record.hospital_id = nil
    assert_not @record.valid?
  end

  test "staff id not blank" do
    @record.staff_id = nil
    assert_not @record.valid?
  end

  test "patient id not blank" do
    @record.patient_id = nil
    assert_not @record.valid?
  end
end
