class BuildingElementDistribution
  include Rhom::FixedSchema

  # Uncomment the following line to enable sync with Building.
  enable :sync
  #set :partition, :app
  set :sync_priority, 2 #should sync first
  set :schema_version, '1.0'

  #add model specifc code here
  property :building_type_reference_id, :string
  property :building_element_id, :string
  property :distribution, :string

  property :created_at, :string
  property :updated_at, :string

  index :index_element_distribution_on_type_reference,[:building_type_reference_id]


end