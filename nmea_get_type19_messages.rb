#!/usr/bin/env ruby
# encoding: utf-8

require 'nmea_plus'

class GetType19Messages

    def aivdm_message_type(message)
    type = message.ais.message_type
    rep_ind = message.ais.repeat_indicator
    mmsi = message.ais.source_mmsi
    return type, rep_ind, mmsi
  end
  
  def aivdm_type19_extended_position(message)
    sog  = message.ais.speed_over_ground
    #accuracy = message.ais.position_10m_accuracy?
    lon = message.ais.longitude.round(6)
    lat = message.ais.latitude.round(6)
    cog = message.ais.course_over_ground
    true_headingh_v  = message.ais.true_heading
    timestamp  = message.ais.time_stamp
    #maneuvre = message.ais.special_manoeuvre
    name_v = message.ais.name.strip
    ship_cargo_type_v = message.ais.ship_cargo_type
    ship_cargo_type_desc_v = message.ais.ship_cargo_type_description
    sd_bow = message.ais.ship_dimension_to_bow
    sd_stern = message.ais.ship_dimension_to_stern
    sd_port = message.ais.ship_dimension_to_port
    sd_starboard = message.ais.ship_dimension_to_starboard
    #epfd_v = message.ais.epfd_type #if message.ais.respond_to? :epfd_type
    #raim_v = message.ais.raim?
    #dte_v = message.ais.dte_ready? #if message.ais.respond_to? :dte
    #assigned_v = message.ais.assigned? 
    return sog, lon, lat, cog, true_headingh_v, timestamp, name_v, 
      ship_cargo_type_v, sd_bow, sd_stern, sd_port, sd_starboard
  end
end
