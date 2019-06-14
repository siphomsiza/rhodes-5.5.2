class BuildingTypeReference
  include Rhom::FixedSchema

  # Uncomment the following line to enable sync with Building.
  enable :sync
  #set :partition, :app
  set :sync_priority, 2 #should sync first
  set :schema_version, '1.0'

  #add model specifc code here
  property :building_type_id, :string
  property :construction_cost, :string
  property :country, :string
  property :created_at, :string
  property :updated_at, :string

  index :index_type_reference_on_building_type,[:building_type_id,:country]

end