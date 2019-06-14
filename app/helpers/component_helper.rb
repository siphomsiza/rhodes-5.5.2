module ComponentHelper
  ELEMENT_MATERIALS={'BuildingConstruction'=>'BuildingMaterial',
                     'BuildingMechanicalEquipment'=>'MechanicalMaterial',
                     'BuildingElectricalEquipment'=>'ElectricalMaterial',
                     'EnvironmentalEngineeringConstruction'=>'EnvironmentalEngineeringMaterial',
                     'SiteworksConstruction'=>'SiteworksMaterial'}

  ELEMENT_TYPES={'BuildingConstruction'=>'BuildingElement',
                 'BuildingMechanicalEquipment'=>'MechanicalEquipment',
                 'BuildingElectricalEquipment'=>'ElectricalEquipment',
                 'EnvironmentalEngineeringConstruction'=>'EnvironmentalEngineering',
                 'SiteworksConstruction'=>'SiteworksElement'}

  ELEMENT_TITLES={'BuildingConstruction'=>'Building',
                 'BuildingMechanicalEquipment'=>'Mechanical Equipment',
                 'BuildingElectricalEquipment'=>'Electrical Equipment',
                 'EnvironmentalEngineeringConstruction'=>'Environmental Engineering',
                 'SiteworksConstruction'=>'Siteworks'}

  ELEMENT_TAB_INDEX={'BuildingConstruction'=>2,'BuildingMechanicalEquipment'=>3,'BuildingElectricalEquipment'=>4,'SiteworksConstruction'=>3,'EnvironmentalEngineeringConstruction'=>4}

  def load_lookups(element_type)
    @elements = Lookup.find_all_by_type ELEMENT_TYPES[@params['t']||@component.t]
    @suitability_ratings = Lookup.find_all_by_type 'SuitabilityRating'
    @material_types = Lookup.find_all_by_type ELEMENT_MATERIALS[element_type],true
    @life_cycles = Lookup.find_all_by_type 'LifeCycle'
    @cause_reasons = Lookup.find_all_by_type 'CauseReason'
    @maintenance_strategies = Lookup.find_all_by_type 'MaintenanceStrategy'
  end
end