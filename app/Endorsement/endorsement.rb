# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
require 'lib/model'

class Endorsement
  include Rhom::FixedSchema
  include Model

  # Uncomment the following line to enable sync with Facility.
  enable :sync

  # Set the current version of the fixed schema.
  # Your application may use it for data migrations.
  set :sync_priority, 10
  set :schema_version, '1.0'

  #add model specifc code here

  belongs_to :asset_information_id, 'AssetInformation'

  property :asset_information_id,:string
  property :endorse_no,:string
  property :holder,:string
  property :amount,:string
  property :description,:string
  property :created_at, :time
  property :updated_at, :time

  index :index_endorsement_on_source, [:asset_information_id,:endorse_no]

  def validate
    self.errors[:endorse_no] = "can't be blank" if self.endorse_no.nil? || self.endorse_no.empty?
    self.errors[:amount] = "can't be blank" if self.amount.nil? || self.amount.empty?
    self.errors[:holder] = "can't be blank" if self.holder.nil? || self.holder.empty?
  end
end

