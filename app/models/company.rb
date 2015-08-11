class Company < ActiveRecord::Base
  has_secure_password
  has_many :tailors
  has_many :availabilities, through: :tailors
  # validates_uniqueness_of :email

  before_save :format_values

  def format_values
    email.donwcase!
  end
end
