class Company < ActiveRecord::Base
  has_secure_password
  has_many :tailors
  has_many :availabilities, through: :tailors
  # validates_uniqueness_of :email
end
