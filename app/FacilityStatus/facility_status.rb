class FacilityStatus
  include Rhom::FixedSchema

  # Uncomment the following line to enable sync with Building.
  enable :sync

  set :sync_priority, 99 #should sync last
  set :schema_version, '1.0'

  #add model specifc code here
  property :facility_id, :string
  property :asset_status_id, :string
  property :user_id, :string
  property :type, :string
  property :created_at, :time
  property :updated_at, :time

  index :index_facility_status_on_facility,[:facility_id,:type]
end