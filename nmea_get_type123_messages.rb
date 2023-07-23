#!/usr/bin/env ruby
# encoding: utf-8

require 'nmea_plus'

class GetType123Messages

  def aivdm_message_type(message)

    type = message.ais.message_type
    rep_ind = message.ais.repeat_indicator
    mmsi = message.ais.source_mmsi
    flag = mmsi.to_s.match(/^[[:digit:]]{3}/)

    return type, rep_ind, mmsi, flag
  end
  
  def aivdm_type123_position(message)
    status = message.ais.navigational_status
    turn = message.ais.rate_of_turn
    if turn.nil?
      turn = 0.0
    elsif !turn.is_a?(Float)
      turn = turn.to_f
    end
    
    sog  = message.ais.speed_over_ground
    #accuracy = message.ais.position_10m_accuracy?
    if message.ais.longitude != nil and message.ais.latitude != nil
      lon = message.ais.longitude.round(6)
      lat = message.ais.latitude.round(6)
    end

    cog = message.ais.course_over_ground
    if cog.nil?
      ## IF SOG IS 0 THERE IS NO COG => COG = 0.0
      cog = 0.0
    elsif !cog.is_a?(Float)
      cog = cog.to_f
    end

    true_headingh_v  = message.ais.true_heading
    if true_headingh_v.nil?
      # 511 = "NOT AVAILABLE"
      true_headingh_v = 511
    elsif !true_headingh_v.is_a?(Integer)
      true_headingh_v = true_headingh_v.to_i
    end

    timestamp  = message.ais.time_stamp
    maneuvre = message.ais.special_manoeuvre # BLUE BOARD FOR INLAND VESSELS

    values_123 = [status, turn, sog, lon, lat, cog, 
    true_headingh_v, timestamp, maneuvre]
    
    values_123.each_with_index do |var, index|
      if var.nil?
        values_123[index] = 0.0
      end
    end

    return status, turn, sog, lon, lat, cog, true_headingh_v, timestamp, maneuvre  
  end
end