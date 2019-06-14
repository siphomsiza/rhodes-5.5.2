# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class MediaStore
  include Rhom::FixedSchema
  # Uncomment the following line to enable sync with Facility.
  enable :sync

  # Set the current version of the fixed schema.
  # Your application may use it for data migrations.
  set :sync_priority, 50
  set :schema_version, '1.0'
  #add model specifc code here

  belongs_to :src_id, 'Building'
  belongs_to :src_id, 'Component'

  property :item_no, :integer
  property :purpose, :string
  property :src_id, :string
  property :src_t, :string
  property :t, :string
  property :data,:blob
  property :created_at, :time
  property :updated_at, :time
  # Define a unique named index on a set of attributes.
  # For example, this will create unique index for the phone column.
  index :index_media_store_on_type, [:t,:src_t,:src_id,:item_no,:data]

  def self.present?(src_t,src_id,t)
    !MediaStore.find(:first,:conditions=>{:src_t=>src_t,:src_id=>src_id,:t=>t}).nil?
  end

  def src_code
    case
      self.src_t
      when 'Facility'
        self.src.code
      when 'Building'
        "Building \##{self.src.building_no} of Facility \##{self.src.facility.code}"
      when 'Component'
        "#{self.src_t} \##{self.src.item_no} of #{self.src.src_code}"
      else
        'Unknown'
    end
  end

  def src
    @src||=Model::constantinize(self.src_t).find self.src_id
  end

end
