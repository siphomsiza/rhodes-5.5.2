# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
require 'lib/model'

class AssetInformation
  include Rhom::FixedSchema
  include Model

  # Uncomment the following line to enable sync with Building.
  enable :sync
  #enable :full_update

  set :sync_priority, 8 #should sync after Facility
  set :schema_version, '1.0'

  #add model specifc code here
  belongs_to :facility_id, 'Facility'

  property :facility_id, :string
  property :erf_number, :string
  property :title_deed_number, :string
  property :extent, :string

  property :num_improvements, :string
  property :extent_improvements, :string
  property :zoning_id, :string
  property :rates_category_id, :string
  property :rateable_value, :string
  property :municipal_ward_id, :string

  property :latitude, :string
  property :longitude, :string
  property :elevation, :string
  property :created_at,:time
  property :updated_at,:time
  property :type, :string

  index :index_asset_information_on_erf, [:type,:facility_id,:erf_number]

  def before_delete
    Endorsement.delete_all :conditions=>{:asset_information_id=>self.object}
    OwnerInformation.delete_all :conditions=>{:asset_information_id=>self.object}
    if self.type == 'MunicipalRollRegister'
      OwnershipDisputes.delete_all :conditions=>{:municipal_roll_register_id=>self.object}
      RatesHistory.delete_all :conditions=>{:municipal_roll_register_id=>self.object}
    end
  end

  def validate
    self.errors[:erf_number] = "can't be blank" if self.erf_number.nil? || self.erf_number.empty?
    self.errors[:title_deed_number] = "can't be blank" if self.type == 'DeedsOffice' && (self.title_deed_number.nil? || self.title_deed_number.empty?)
    self.errors[:extent] = "can't be blank" if self.extent.nil? || self.extent.empty?
  end
end
