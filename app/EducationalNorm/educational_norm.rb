require 'lib/model'

class EducationalNorm
  include Rhom::FixedSchema
  include Model
  # Uncomment the following line to enable sync with Facility.
  enable :sync
  set :sync_priority, 10

  # Set the current version of the fixed schema.
  # Your application may use it for data migrations.
  set :schema_version, '1.0'
  #add model specifc code here
  property :facility_id, :string
  property :site_size, :string
  property :site_location_id, :string
  property :site_comments, :string
  property :school_prototype_id, :string
  property :school_size, :string
  property :number_of_educators, :string
  property :identification_compliance_id, :string
  property :identification_comments, :string
  property :sanitation_compliance_id, :string
  property :security_compliance_id, :string
  property :sanitation_comments, :string
  property :security_comments, :string
  property :water_supply_compliance_id, :string
  property :water_supply_comments, :string
  property :connectivity_compliance_id, :string
  property :connectivity_comments, :string
  property :electricity_supply_compliance_id, :string
  property :electricity_supply_comments, :string

  property :created_at, :time
  property :updated_at, :time

  # Define a unique named index on a set of attributes.
  # For example, this will create unique index for the phone column.
  index :index_educational_norm_on_facility_id, [:facility_id]

end