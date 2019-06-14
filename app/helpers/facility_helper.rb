module FacilityHelper
  def facility_title
    "#{@facility.code} #{System.get_property('screen_orientation') == 'landscape' ? @facility.name : ''}"
  end
end