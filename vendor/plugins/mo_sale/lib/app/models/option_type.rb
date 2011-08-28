class OptionType < ActiveRecord::Base
  has_many :option_values, :order => :position, :dependent => :destroy
  has_many :product_option_types, :dependent => :destroy
  
  validates :name, :presentation, :presence => true
  
  default_scope :order => "option_types.position"

  accepts_nested_attributes_for :option_values, :reject_if => lambda { |ov| ov[:name].blank? || ov[:presentation].blank? }, :allow_destroy => true
end