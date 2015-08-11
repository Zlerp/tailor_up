class Tailor < ActiveRecord::Base
  has_secure_password

  has_many :availabilities

  has_many :appointments

  belongs_to :company
  mount_uploader :image, ImageUploader
  before_save :format_values
  # validates_uniqueness_of :email, :phone
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates_format_of :phone, :with => /\A(1?(?: |\-|\.)?(?:\(\d{3}\)|\d{3})(?: |\-|\.)?\d{3}(?: |\-|\.)?\d{4})\z/, message: "incorrect format, ex. 888-888-8888"


  def format_values
    first_name.capitalize!
    last_name.capitalize!
    email.downcase!
  end


end
