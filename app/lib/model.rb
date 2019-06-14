module Model

  def errors
    @object_errors ||= {}
  end

  def validate_and_save
    self.save if self.valid?
    if @object_errors.empty?
      @new_record = false
      true
    else
      false
    end
  end

  def attributes=(attr)
    attr.each {|a| self.vars[a[0].to_sym] = a[1]}
  end

  def attributes
    self.class.model_params['schema']['property'].inject({}) {|attrs,prop| attrs[prop[0]] = self.vars[prop[0]] }
  end

  def valid?
    @object_errors = {}
    self.validate
    @object_errors.empty?
  end

  def exists?(scope={})
    self.class.find :first,:conditions=>scope
  end

  def unique?(scope={})
    obj = exists?(scope)
    obj.nil? || (obj.object == self.object)
  end

  def new_record?
    @new_record ||= Model::constantinize(self.class.name).find(self.object).nil?
  end

  def changes
    Rho::RHO::get_src_db(self.get_inst_source_name).execute_sql("SELECT * FROM changed_values WHERE source_id=? AND object=?",get_inst_source_id().to_i(),self.object)
  end

  def attribute_changed?(attr)
    !Rho::RHO::get_src_db(self.get_inst_source_name).execute_sql("SELECT * FROM changed_values WHERE source_id=? AND object=? AND attrib=?",get_inst_source_id().to_i(),self.object,attr).empty?
  end

  def self.constantinize(name)
    constant = Object
    constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
  end
end