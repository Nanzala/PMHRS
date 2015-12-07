require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    #@record = Record.new(staff_id: '1', height: nil, weight: nil, temperature: nil, blood_pressure: nil, symptoms: nil, diagnosis: nil, patient_id: 1)
    @record = Record.new( staff_id: "657b2a62-2973-41fa-9a24-945612643358", height: 165, weight: 54, temperature: 38, blood_pressure: "117/90", symptoms: "Fever, Rashes", diagnosis: "Heat Exposure", patient_id: "7d31fcfd-775c-4420-a274-3183ec4911a5")
  end

  test "valid record" do
    assert @record.valid?
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
