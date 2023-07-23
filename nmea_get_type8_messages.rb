#!/usr/bin/env ruby
# encoding: utf-8

require 'nmea_plus'

class GetType8Messages

    def aivdm_message_type(message)
    type = message.ais.message_type
    rep_ind = message.ais.repeat_indicator
    mmsi = message.ais.source_mmsi

    return type, rep_ind, mmsi
  end
  
  def aivdm_type8_position(message)
          
    ev_id = message.ais.dp.european_vessel_id  
    dim_length = message.ais.dp.dimension_length
    dim_beam = message.ais.dp.dimension_beam
    ship_type = message.ais.dp.ship_type
    ship_type_description = message.ais.dp.ship_type_description
    #dim_draught_v = message.ais.dp.dimension_draught
    
    if message.ais.dp.dimension_draught.nil? == true
      dim_draught_v = nil
    else
      dim_draught_v = message.ais.dp.dimension_draught 
    end
    
    if message.ais.dp.hazardous_cargo.nil? == true
      haz_cargo_v = nil
    else
      haz_cargo_v = message.ais.dp.hazardous_cargo 
    end
    
     haz_cargo_desc = message.ais.dp.hazardous_cargo_description
    
    if message.ais.dp.load_status.nil? == true
      load_status_v = nil
    else
      load_status_v = message.ais.dp.load_status 
    end
    
    load_status_desc_v = message.ais.dp.load_status_description
    speed_qual = message.ais.dp.speed_quality
    course_qual = message.ais.dp.course_quality
    heading_qual = message.ais.dp.heading_quality

    return ev_id, dim_length, dim_beam, ship_type, dim_draught_v, haz_cargo_v, load_status_v
  end
end
