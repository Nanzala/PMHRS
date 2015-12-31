require 'test_helper'

class HospitalTest < ActiveSupport::TestCase

  def setup
    @hospital = Hospital.new(name: 'Achimota General', location: 'Achimota Area', level: 3, address: '123 Achimota, Ghana', ref: '123TEST')
  end

  test "valid hospital record" do
    assert @hospital.valid?
  end

  test "hospital name not blank" do
    @hospital.name = ' '
    assert_not @hospital.valid?
  end

  test "hospital location not blank" do
    @hospital.location = ' '
    assert_not @hospital.valid?
  end

  test "hospital level not blank" do
    @hospital.level = nil
    assert_not @hospital.valid?
  end

  test "hospital address not blank" do
    @hospital.address = ' '
    assert_not @hospital.valid?
  end

  test "hospital ref not blank" do
    @hospital.ref = nil
    assert_not @hospital.valid?
  end
end
