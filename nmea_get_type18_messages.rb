#!/usr/bin/env ruby
# encoding: utf-8

require 'nmea_plus'

class GetType18Messages

    def aivdm_message_type(message)
    type = message.ais.message_type
    rep_ind = message.ais.repeat_indicator
    mmsi = message.ais.source_mmsi
    return type, rep_ind, mmsi
  end
  
  def aivdm_type18_position(message)
    sog  = message.ais.speed_over_ground
    #accuracy = message.ais.position_10m_accuracy?
    lon = message.ais.longitude.round(6)
    lat = message.ais.latitude.round(6)
    cog = message.ais.course_over_ground
    true_headingh_v  = message.ais.true_heading
    timestamp  = message.ais.time_stamp
    #raim_v = message.ais.raim?
    return sog, lon, lat, cog, true_headingh_v, timestamp
  end
end
