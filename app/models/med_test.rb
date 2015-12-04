class MedTest < ActiveRecord::Base
  validates  :test,   presence:true
  validates  :result, presence:true

  belongs_to :records
end
