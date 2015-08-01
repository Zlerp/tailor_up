class Company < ActiveRecord::Base
  has_secure_password
  has_many :tailors
end
