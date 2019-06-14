# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
require 'lib/model'

class Building
  include Rhom::FixedSchema
  include Model

  # Uncomment the following line to enable sync with Building.
  enable :sync
  #enable :full_update

  set :sync_priority, 3 #should sync after Facility
  set :schema_version, '1.0'

  #add model specifc code here
  belongs_to :facility_id, 'Facility'

  property :facility_id, :string
  property :building_no, :string
  property :name, :string
  property :building_type_id, :string
  property :utilisation_status, :string
  property :latitude, :string
  property :longitude, :string
  property :elevation, :string
  property :first_year_of_occupation, :string
  property :last_maintenance_year, :string
  property :disabled_access_id, :string
  property :disabled_comment, :string
  property :building_standard_id, :string
  property :construction_description, :string
  property :floor_count, :string
  property :total_footprint_area, :string
  property :total_construction_area, :string
  property :is_heritage, :string
  property :t, :string
  property :condition_index_id, :string
  property :created_at, :time
  property :updated_at, :time

  index :index_building_on_no, [:facility_id,:building_no]

  def building_type_text
    Lookup.find(self.building_type_id).description
  end

  def validate
    self.errors[:total_construction_area] = "can't be blank" if self.total_construction_area.nil? || self.total_construction_area.empty?
    self.errors[:total_footprint_area] = "can't be blank" if self.total_footprint_area.nil? || self.total_footprint_area.empty?
    self.errors[:first_year_of_occupation]= "can't be blank" if self.first_year_of_occupation.nil? || self.first_year_of_occupation.empty?
    self.errors[:last_maintenance_year]= "can't be blank" if self.last_maintenance_year.nil? || self.last_maintenance_year.empty?
    self.errors[:utilisation_status]= "can't be blank" if self.utilisation_status.nil? || self.utilisation_status.empty?
    self.errors[:floor_count]= "can't be blank" if self.floor_count.nil? || self.floor_count.empty?
    self.errors[:construction_description]= "can't be blank" if self.construction_description.nil? || self.construction_description.empty?
    self.errors[:disabled_comment]= "can't be blank" if self.disabled_comment.nil? || self.disabled_comment.empty?
    self.errors[:name]= "can't be blank" if self.name.nil? || self.name.empty?
    if self.building_no.nil? || self.building_no.empty?
      self.errors[:building_no]= "can't be blank"
    else
      b = Building.find(:first,:conditions=>{:facility_id=>self.facility_id,:building_no=>self.building_no})
      self.errors[:building_no] = "has already been taken" unless b.nil? || (b.object == self.object)
    end
  end

  def before_delete
    Component.find(:all,:conditions=>{"src_t"=>'Building',"src_id"=>self.object}).each do |cmp|
      cmp.before_delete
      cmp.destroy
    end
    MediaStore.find(:all, :conditions=>{"src_t"=>'Building','src_id'=>self.object}).each {|m| m.destroy }
    Space.find(:all,:conditions=>{:src_t=>'Building',:src_id=>self.object}).each do |s|
      s.before_delete
      s.destroy
    end
  end

  def add_construction_elements
    if Component.find(:count,:conditions=>{:src_t=>'Building',:src_id=>self.object,:t=>'BuildingConstruction'}) == 0
      cause_reason_id = Lookup.find(:first,:select=>['object'],:conditions=>{:label=>'S',:type=>'CauseReason'}).object
      type_reference = BuildingTypeReference.find :first, :conditions=>{:building_type_id=>self.building_type_id,:country=>System.get_property('country')}
      if type_reference
        BuildingElementDistribution.find(:all,:select=>['building_element_id'],:conditions=>{:building_type_reference_id=>type_reference.object}).each_with_index do |element_distribution,index|
          Component.create({:src_t=>'Building',
                            :src_id=>self.object,
                            :t=>'BuildingConstruction',
                            :element_id=>element_distribution.building_element_id,
                            :item_no=>('%02d' % (index + 1)),
                            :is_present=>'true',
                            :cause_reason_id=>cause_reason_id})
        end
      end
    end
  end

  def facility= f
    self.facility_id = (@facility = f).object
  end

  def facility
    @facility||= Facility.find self.facility_id
  end
end
