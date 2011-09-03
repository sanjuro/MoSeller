class Product < ActiveRecord::Base
  belongs_to :product_source
  belongs_to :category
  has_many :product_option_types, :dependent => :destroy
  has_many :option_types, :through => :product_option_types
  has_many :product_properties, :dependent => :destroy
  has_many :properties, :through => :product_properties
  has_many :images, :as => :viewable, :order => :position, :dependent => :destroy
  
  has_one :master,
    :class_name => 'Variant',
    :conditions => ["variant.is_master = ? AND variant.deleted_at IS NULL", true]

  delegate_belongs_to :master, :sku, :price, :is_master
  delegate_belongs_to :master, :cost_price if Variant.table_exists? && Variant.column_names.include?("cost_price")  
  
  after_create :set_master_variant_defaults
  before_update :sanitize_permalink
  after_save :save_master

  has_many :variants,
    :conditions => ["variant.is_master = ? AND variant.deleted_at IS NULL", false],
    :order => 'variants.position ASC'  
  
  has_many :variants_including_master,
    :class_name => 'Variant',
    :conditions => ["variant.deleted_at IS NULL"],
    :dependent => :destroy

  has_many :variants_with_only_master,
    :class_name => 'Variant',
    :conditions => ["variant.deleted_at IS NULL AND variant.is_master = ?", true],
    :dependent => :destroy
    
  def variant_images
    Image.find_by_sql("SELECT assets.* FROM assets LEFT JOIN variants ON (variants.id = assets.viewable_id) WHERE (variants.product_id = #{self.id})")
  end    
    
  validates :name, :cost_price, :customer_price, :presence => true  
  
  # make_permalink   
  
  alias :options :product_option_types 
  
  def to_param
    return permalink if permalink.present?
    name.to_url
  end

  # returns true if the product has any variants (the master variant is not a member of the variants array)
  def has_variants?
    !variants.empty?
  end  
  
  # use deleted? rather than checking the attribute directly. this
  # allows extensions to override deleted? if they want to provide
  # their own definition.
  def deleted?
    !!deleted_at
  end
  
  # split variants list into hash which shows mapping of opt value onto matching variants
  # eg categorise_variants_from_option(color) => {"red" -> [...], "blue" -> [...]}
  def categorise_variants_from_option(opt_type)
    return {} unless option_types.include?(opt_type)
    variants.active.group_by {|v| v.option_values.detect {|o| o.option_type == opt_type} }
  end

  def self.like_any(fields, values)
    where_str = fields.map{|field| Array.new(values.size, "products.#{field} #{LIKE} ?").join(' OR ') }.join(' OR ')
    self.where([where_str, values.map{|value| "%#{value}%"} * fields.size].flatten)
  end
  
  private
  
  def sanitize_permalink
    self.permalink = self.permalink.to_url
  end
  
  # ensures the master variant is flagged as such
  def set_master_variant_defaults
    master.is_master = true
  end
  
  # there's a weird quirk with the delegate stuff that does not automatically save the delegate object
  # when saving so we force a save using a hook.
  def save_master
    master.save if master && (master.changed? || master.new_record?)
  end
  
end