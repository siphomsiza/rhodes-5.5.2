# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
require 'lib/model'

class RatesHistory
  include Rhom::FixedSchema
  include Model

  # Uncomment the following line to enable sync with Facility.
  enable :sync

  # Set the current version of the fixed schema.
  # Your application may use it for data migrations.
  set :sync_priority, 12
  set :schema_version, '1.0'

  #add model specifc code here

  belongs_to :municipal_roll_register_id, 'AssetInformation'

  property :municipal_roll_register_id,:string
  property :rate,:string
  property :rateable_value,:string
  property :rate_year,:string

  property :created_at,:time
  property :updated_at,:time

  index :index_rates_history_on_year, [:municipal_roll_register_id,:rate_year]

  def validate
    self.errors[:rate] = "can't be blank" if self.rate.nil? || self.rate.empty?
    self.errors[:rateable_value] = "can't be blank" if self.rateable_value.nil? || self.rateable_value.empty?
    if self.rate_year.nil? || self.rate_year.empty?
      self.errors[:rate_year] = "can't be blank"
    else
      self.errors[:rate_year] = "has already been taken" unless self.unique?({:municipal_roll_register_id=>self.municipal_roll_register_id,:rate_year=>self.rate_year})
    end
  end

end

