# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
require 'lib/model'

class Space
  include Rhom::FixedSchema
  include Model

  # Uncomment the following line to enable sync with Facility.
  enable :sync

  # Set the current version of the fixed schema.
  # Your application may use it for data migrations.
  set :schema_version, '1.0'
  set :sync_priority, 20
  belongs_to :src_id, 'Building'

  #add model specifc code here
  property :current_usage_id, :string
  property :previous_usage_id, :string
  property :unit_size, :string
  property :comments, :string

  property :space_no, :integer
  property :src_id, :string
  property :src_t, :string
  property :t, :string
  property :created_at, :time
  property :updated_at, :time
  # Define a unique named index on a set of attributes.
  # For example, this will create unique index for the phone column.
  index :index_space_on_type, [:t,:src_t,:src_id,:space_no]

  def space_type_text
    begin
      Lookup.find(self.current_usage_id).description
    rescue
    end
  end

  def validate
    self.errors[:unit_size] = "can't be blank" if self.unit_size.nil? || self.unit_size.empty?
    #c = Space.find(:first,:conditions=>{:src_id=>self.src_id,:src_t=>self.src_t,:t=>self.t,:current_usage_id=>self.current_usage_id})
    #self.errors[:current_usage_id] = "has already been taken" unless c.nil? || (c.object == self.object)
  end

  def before_delete
    Fixture.delete_all :conditions=>{'space_id'=>self.object}
  end
end
