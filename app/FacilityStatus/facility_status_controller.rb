require 'rho/rhocontroller'
require 'helpers/application_helper'

class FacilityStatusController < Rho::RhoController
  include ApplicationHelper

  def show
    @facility_status = FacilityStatus.find @params['id']
    if @facility_status
      @facility = Facility.find @facility_status.facility_id
      if @facility
        redirect :controller=>:Facility,:action=>:show,:id=>@facility.object
      else
        object_not_found
      end
    else
      object_not_found
    end
  end
end