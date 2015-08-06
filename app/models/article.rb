class Article < ActiveRecord::Base
  belongs_to :appointment
  accepts_nested_attributes_for :appointment
end
