class Availability < ActiveRecord::Base
  belongs_to :tailor
  scope :tailor, ->(tailor_id) { Availability.where company_id: tailor_id }
end
