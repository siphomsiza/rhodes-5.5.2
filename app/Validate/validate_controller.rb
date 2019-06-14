require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class ValidateController < Rho::RhoController
  include BrowserHelper
  # To change this template use File | Settings | File Templates.
  def index

  end
private

  def validate
    errors=[]
    Facility.find(:all).eaxh do |facility|
      errors << "#{facility.code}: No coordinates" if facility.latitude.nil? || facility.latitude.empty? || facility.longitude.nil? || facility.longitude.empty?
      errors << "#{facility.code}: Unknown site location accessibility" if facility.site_location_accessibility_id.nil?
      errors << "#{facility.code}: Unknown functionality site" if facility.functionality_site_id.nil?
      errors << "#{facility.code}: Unknown functionality accomodation" if facility.functionality_accomodation_id.nil?
      errors << "#{facility.code}: Unknown functionality layout" if self.functionality_layout_id.nil?
      errors << "#{facility.code}: No accessibilities" if Accessibility.find(:all,:conditions=>{:facility_id=>facility.object}).empty?
      errors << "#{facility.code}: No photo" if MediaStore.find(:all,:conditions=>{:src_id=>facility.object,:src_t=>'Facility',:t=>'Photo'}).empty?
      errors << "#{facility.code}: No drawning plan" if MediaStore.find(:all,:conditions=>{:src_id=>facility.object,:src_t=>'Facility',:t=>'DrawningPlan'}).empty?
      errors << "#{facility.code}: No buildings" if Building.find(:all,:conditions=>{:facility_id=>facility.object}).empty?
      errors << "#{facility.code}: No siteworks elements" if Component.find(:all,:conditions=>{:src_id=>facility.object,:src_t=>'Facility',:t=>'SiteworksConstruction'}).empty?
      errors << "#{facility.code}: No env. eng. elements"  if Component.find(:all,:conditions=>{:src_id=>facility.object,:src_t=>'Facility',:t=>'EnvironmentalEngineeringConstruction'}).empty?

      BoundaryPolygon.find(:all,:conditions=>{:facility_id=>facility.object}).each do |polygon|

      end
      Accessibility.find(:all,:conditions=>{:facility_id=>facility.object}).each do |accessibility|

      end
      Componetns.find(:all,:conditions=>{:facility_id=>facility.object}).each do |componnt|
      end
      Building.find(:all,:conditions=>{:facility_id=>facility.object}).each do |building|

      end
    end
    errors
  end
end