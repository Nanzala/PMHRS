require 'test_helper'

class RecordTest < ActiveSupport::TestCase

  def setup
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
