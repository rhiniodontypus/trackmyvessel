#!/usr/bin/env ruby
# encoding: utf-8

require 'nmea_plus'

class GetType27Messages

  def aivdm_message_type(message)
    type = message.ais.message_type
    rep_ind = message.ais.repeat_indicator
    mmsi = message.ais.source_mmsi
    return type, rep_ind, mmsi
  end
            
  def aivdm_type27(message)
    #puts "MESSAGE TYPE 27 (Long Range AIS Broadcast message)"
    #accuracy = message.ais.position_10m_accuracy?
    #raim_v = message.ais.raim?
    status = message.ais.navigational_status
    lon = message.ais.longitude.round(6)
    lat = message.ais.latitude.round(6)
    sog  = message.ais.speed_over_ground
    cog = message.ais.course_over_ground
    gnss_v = message.ais.gnss?
    return status, lon, lat, sog, cog, gnss_v
  end
end
