class Article < ActiveRecord::Base
  belongs_to :appointment
  accepts_nested_attributes_for :appointment
  validates_numericality_of :quantity, :only_integer =>true,
                          :greater_than_or_equal_to => 1, 
                          :message => "invalid quantity"
end
