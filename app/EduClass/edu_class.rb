require 'lib/model'

class EduClass
  include Rhom::FixedSchema
  include Model

  # Uncomment the following line to enable sync with Facility.
  enable :sync

    # Set the current version of the fixed schema.
    # Your application may use it for data migrations.

  set :schema_version, '1.0'
  set :sync_priority, 11
  #add model specifc code here

  property :facility_id, :string
  property :grade_id,:string
  property :class_count,:string
  property :learner_count,:string

  property :created_at, :time
  property :updated_at, :time

  index :index_edu_class_on_facility_id, [:facility_id]

  def validate
    if self.grade_id.nil? || self.grade_id.empty?
      self.errors[:grade_id]= "can't be blank"
    else
      self.errors[:grade_id] = "has already been taken" unless self.unique?({:facility_id=>self.facility_id,:grade_id=>self.grade_id})
    end
    self.errors[:class_count] = "can't be blank" if self.class_count.nil? || self.class_count.empty?
    if self.learner_count.nil? || self.learner_count.empty?
      self.errors[:learner_count] = "can't be blank"
    else
      n = EducationalNorm.find self.facility_id
      cnt = self.learner_count.to_i + EduClass.find(:all,:conditions=>['facility_id = ? and object !=',self.facility_id,self.object]).inject(0) {|s,c| s + c.learner_count.to_i}
      self.errors[:learner_count] = 'invalid value' if !n.nil? and (cnt > n.school_size.to_i)
    end
  end

  def grade_text
    Lookup.find(self.grade_id).description
  end

end