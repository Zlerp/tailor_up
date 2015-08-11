class User < ActiveRecord::Base
  has_secure_password
  has_many :appointments
  mount_uploader :image, ImageUploader

  before_save :format_values
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates_uniqueness_of :email, :phone
  # validates_format_of :phone, :with => /\A(1?(?: |\-|\.)?(?:\(\d{3}\)|\d{3})(?: |\-|\.)?\d{3}(?: |\-|\.)?\d{4})\z/, message: "incorrect format, ex. 888-888-8888"
  # validates :zip, format: { with: /(^\d{5}$)|(^\d{5}-\d{4}$)/, message: "Invalid Zipcode" }


  ########## For Faker Gem ONLY  ############
  # validates_uniqueness_of :email, :phone, :first_name, :last_name, :address

  def format_values
    first_name.capitalize!
    last_name.capitalize!
    email.downcase!
  end
end
