      #!/usr/bin/env ruby
# encoding: utf-8

require 'nmea_plus'

class GetType24Messages

  def aivdm_message_type(message)
    type = message.ais.message_type
    rep_ind = message.ais.repeat_indicator
    mmsi = message.ais.source_mmsi
    return type, rep_ind, mmsi
  end
  
  # SELECTS MESSAGE TYPE 24 (CLASS B STATIC DATA) WHICH CAN BE DISTINGUISHED
  # BETWEEN PART 0 (ONLY SHIP NAME) AND PART 1 (EITHER SHIP DIMENSIONS OR
  # AUXILIARY CRAFT INFORMATION)
  def aivdm_type24_static_pn0(message)
    name_v = message.ais.name.strip
    return name_v  
  end               
  
  # TYPE 24 MESSAGE CONTAINING MOTHERSHIP MMSI/AUXILIARY CRAFT
  def aivdm_type24_static_aux_pn1(message)

    if message.ais.ship_cargo_type <= 99
      ship_cargo_type_v = message.ais.ship_cargo_type
    else 
      ship_cargo_type_v = 0
    end
    ship_cargo_type_desc_v = message.ais.ship_cargo_type_description
    #vendor_id_v = message.ais.vendor_id
    #model_code_v = message.ais.model_code
    #serial_number_v = message.ais.serial_number
    callsign_v = message.ais.callsign.strip

    mothership_mmsi_v = message.ais.mothership_mmsi
    return ship_cargo_type_v, mothership_mmsi_v, callsign_v
  end
  
  # TYPE 24 MESSAGE CONTAINING VESSEL DIMENSIONS
  def aivdm_type24_static_vd_pn1(message)
  
    if message.ais.ship_cargo_type <= 99
      ship_cargo_type_v = message.ais.ship_cargo_type
    else 
      ship_cargo_type_v = 0
    end
    ship_cargo_type_desc_v = message.ais.ship_cargo_type_description
    #vendor_id_v = message.ais.vendor_id
    #model_code_v = message.ais.model_code
    #serial_number_v = message.ais.serial_number
    callsign_v = message.ais.callsign.strip
  
    sd_bow = message.ais.ship_dimension_to_bow #if message.ais.respond_to? :ship_dimension_to_bow
    sd_stern = message.ais.ship_dimension_to_stern #if message.ais.respond_to? :ship_dimension_to_stern
    sd_port = message.ais.ship_dimension_to_port #if message.ais.respond_to? :ship_dimension_to_port
    sd_starboard = message.ais.ship_dimension_to_starboard #if message.ais.respond_to? :ship_dimension_to_starboard
    
    return ship_cargo_type_v, callsign_v, sd_bow, sd_stern, sd_port, sd_starboard 
  end
end
