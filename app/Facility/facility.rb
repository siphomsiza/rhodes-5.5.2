# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here\
require 'lib/model'

class Facility
  include Rhom::FixedSchema
  include Model
  # Uncomment the following line to enable sync with Facility.
  enable :sync

  # Set the current version of the fixed schema.
  # Your application may use it for data migrations.
  set :sync_priority, 2
  set :schema_version, '1.0'
  #add model specifc code here
  property :code, :string
  property :name, :string
  property :client_code,:string
  property :settlement_type_id, :string
  property :province_id,:string
  property :street_address,:string
  property :suburb,:string
  property :local_municipality_id,:string
  property :site_location_accessibility_id, :string
  property :functionality_site_id, :string
  property :functionality_accomodation_id, :string
  property :functionality_layout_id, :string
  property :latitude, :string
  property :longitude, :string
  property :elevation, :string
  property :offline_client_id, :string
  property :responsible_name, :string
  property :responsible_designation, :string
  property :responsible_phone, :string
  property :responsible_email, :string
  property :facility_type_id,:string
  property :required_performance_index_id,:string
  property :accessibility_rating_index_id,:string
  property :created_at,:time
  property :updated_at,:time
  # Define a unique named index on a set of attributes.
  # For example, this will create unique index for the phone column.
  index :index_facility_on_code, [:code]

  def get_condition_assessment_status_text
    #Lookup.find( FacilityStatus.find(:first,:conditions=>{:facility_id=>self.object,:type=>'ConditionAssessmentInfo'}).asset_status_id ).description
    status = FacilityStatus.find(:first,:conditions=>{:facility_id=>self.object,:type=>'ConditionAssessmentInfo'})
    Lookup.find(status.asset_status_id).description if status
  end

  def facility_type_text
    begin
      Lookup.find(self.facility_type_id).description if Lookup.find(self.facility_type_id)
    rescue
    end
  end

  def validate
    errors = []
    errors
  end

  def checkout?
    self.offline_client_id == System::get_property('phone_id') #&& !self.attribute_changed?('offline_client_id')
  end
  def checkin?
    (self.offline_client_id.nil? || self.offline_client_id.empty?)
  end

  def asset_register_data_accessibly?
    !self.get_asset_status_id('AssetRegisterInfo').nil?
  end

  def condition_assessment_data_accessibly?
    !self.get_asset_status_id('ConditionAssessmentInfo').nil?
  end

  def education_data_accessibly?
    !self.get_asset_status_id('EducationInfo').nil?
  end

  def get_asset_status_id(type)
    s = FacilityStatus.find(:first,:conditions=>{:facility_id=>self.object,:type=>type})
    s.asset_status_id if s
  end

  def buildings
    Building.find(:all,:conditions=>{:facility_id => self.object}, :order=>['building_no'])
  end
end
