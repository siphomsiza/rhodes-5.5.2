# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
require 'lib/model'

class Component
  include Rhom::FixedSchema
  include Model

  # Uncomment the following line to enable sync with Facility.
  enable :sync

  # Set the current version of the fixed schema.
  # Your application may use it for data migrations.
  set :sync_priority, 4
  set :schema_version, '1.0'

  belongs_to :src_id, 'Building'

  #add model specifc code here
  property :item_no, :string
  property :element_id, :string
  property :suitability_rating_id, :string
  property :condition_rating_level_1, :string
  property :condition_rating_level_2, :string
  property :condition_rating_level_3, :string
  property :condition_rating_level_4, :string
  property :condition_rating_level_5, :string
  property :material_type_id, :string
  property :is_present, :string
  property :life_cycle_id, :string
  property :cause_reason_id, :string
  property :comments, :string
  property :maintenance_strategy_id, :string
  property :width, :string
  property :length, :string
  property :height, :string
  property :area, :string
  property :src_id, :string
  property :src_t, :string
  property :t, :string
  property :created_at, :time
  property :updated_at, :time

  # Define a unique named index on a set of attributes.
  # For example, this will create unique index for the phone column.
  index :index_component_on_type, [:t,:src_t,:src_id,:item_no]

  def element_text
    Lookup.find(self.element_id).description
  end

  def validate
    self.errors[:comments] = "can't be blank" if self.comments.nil? || self.comments.empty?
    self.errors[:condition_rating_level_1] = 'Condition total (x %) does not equal 100%' unless (condition_rating_level_1.to_i+condition_rating_level_2.to_i+condition_rating_level_3.to_i+condition_rating_level_4.to_i+condition_rating_level_5.to_i) == 100
    c = Component.find(:first,:conditions=>{:src_id=>self.src_id,:src_t=>self.src_t,:t=>self.t,:element_id=>self.element_id})
    self.errors[:element_id] = "has already been taken" unless c.nil? || (c.object == self.object)

  end

  def condition_ratings
    [condition_rating_level_1.to_i,condition_rating_level_2.to_i,condition_rating_level_3.to_i,condition_rating_level_4.to_i,condition_rating_level_5.to_i]
  end

  def before_delete
    #puts "CMP_BEFORE_DELETE"
    MediaStore.find(:all, :conditions=>{"src_t"=>'Component','src_id'=>self.object}).each do |m|
      #puts "MS:"+m.inspect
      m.destroy
    end
  end

  def self.element_count(src_t,src_id,t)
    Component.find :count,:conditions=>{:src_t=>src_t,:src_id=>src_id,:t=>t}
  end

  def src_code
    self.src_t == 'Facility' ? src.code : "Building\##{self.src.building_no} of Facility \##{self.src.facility.code}"
  end

  def src
    @src||=Model::constantinize(self.src_t).find self.src_id
  end

end
