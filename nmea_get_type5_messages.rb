#!/usr/bin/env ruby
# encoding: utf-8

require 'nmea_plus'

class GetType5Messages

  # TYPE 5 MESSAGE: 1. LINE
  # EXAMPLE: !AIVDM,2,1,8,B,539MP4029pMH@L8N2209DM<TE:37R2222222220l1P@546<E0;PUE6QS1E28,0*7D
  def aivdm_2_1(line)
    puts
    puts "CHECKING TYPE 5 MESSAGE"
    puts line                                       
    input1 = line
  end
  
  # TYPE 5 MESSAGE: 2. LINE
  # EXAMPLE: !AIVDM,2,2,8,B,88888888880,2*2F
  def aivdm_2_2(line)
    puts line
    input2 = line
  end
  
  def aivdm_message_type(message)

    type = message.ais.message_type
    rep_ind = message.ais.repeat_indicator
    mmsi = message.ais.source_mmsi

    return type, rep_ind, mmsi
  end
  
  # TYPE 5 MESSAGE: STATIC AND VOYAGE DATA
  def aivdm_type5_static(message)
    imo_v = message.ais.imo_number
    callsign_v = message.ais.callsign.strip
    name_v = message.ais.name.strip
    
    if message.ais.ship_cargo_type <= 99
      ship_cargo_type_v = message.ais.ship_cargo_type
    else 
      ship_cargo_type_v = 0
    end
    
    ship_cargo_type_desc_v = message.ais.ship_cargo_type_description
    sd_bow = message.ais.ship_dimension_to_bow
    sd_stern = message.ais.ship_dimension_to_stern
    sd_port = message.ais.ship_dimension_to_port
    sd_starboard = message.ais.ship_dimension_to_starboard

    if message.ais.eta.nil? == false
      
      # METHODS THAT WERE ORIGINALLY ALREADY THERE, BUT THE "ETA.MINUTE" METHOD
      # DID NOT WORK, SO THE UPPER ONES ARE TAKEN
      eta_month_v = message.ais.eta.month
      eta_day_v = message.ais.eta.day
      eta_hour_v = message.ais.eta.hour
      eta_minute_v = message.ais.eta.min
      #eta_timestamp_v = message.ais.eta
      ## TIMESTAMP METHOD IS NOT WORKING SO TS = nil
      ## TS CREATION MUST BE DONE FROM SINGLE TIME VALUES ABOVE
      eta_timestamp_v = nil
    else
      eta_month_v = nil
      eta_day_v = nil
      eta_hour_v = nil
      eta_minute_v = nil
      eta_timestamp_v = nil
    end
    
    epfd_v = message.ais.epfd_type
    draught_v = message.ais.static_draught
    dest_v = message.ais.destination.strip
    #dte_v = message.ais.dte_ready?
    
    return imo_v, callsign_v, name_v, ship_cargo_type_v, ship_cargo_type_desc_v,
      sd_bow, sd_stern, sd_port, sd_starboard, eta_month_v, eta_day_v,
      eta_hour_v, eta_minute_v, eta_timestamp_v, epfd_v, draught_v, dest_v
  end
end
