class Tailor < ActiveRecord::Base
  has_secure_password
  belongs_to :company
  # validates_uniqueness_of :email, :phone
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates_format_of :phone, :with => /\A(1?(?: |\-|\.)?(?:\(\d{3}\)|\d{3})(?: |\-|\.)?\d{3}(?: |\-|\.)?\d{4})\z/, message: "incorrect format, ex. 888-888-8888"
end
