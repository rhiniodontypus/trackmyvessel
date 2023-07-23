#!/usr/bin/env ruby
# encoding => utf-8

require 'sequel'
require 'time'

#Sequel.database_timezone = :utc
Sequel.database_timezone = :local

## CREATING SQL STATEMENTS FOR DB INSERTS

class DatabaseStore

  def initialize(mmsi)
    @mmsi = mmsi
  end
  
  ## INSERTING TYPE 1/2/3 DATA
  def insert_nmea_type123_data(ais_type1_2_3_hash)
    items = DB[:tmv_position_report_wo_increment_nmea]
    items.on_duplicate_key_update(
      :mmsi_nmea,
      :flag_nmea,
      :message_type_nmea,
      :navig_status_nmea,
      :rate_of_turn_nmea,
      :speed_over_ground_nmea,
      :longitude_nmea,
      :latitude_nmea,
      :course_over_ground_nmea,
      :true_heading_nmea,
      :regional_res_nmea,
      :aivdm_message_nmea
    ).multi_insert(
       [{:mmsi_nmea => "#{ais_type1_2_3_hash[:mmsi]}",
         :flag_nmea => "#{ais_type1_2_3_hash[:flag]}",
         :message_type_nmea => "#{ais_type1_2_3_hash[:message_type]}",
         :navig_status_nmea => "#{ais_type1_2_3_hash[:navig_status]}",
         :rate_of_turn_nmea => "#{ais_type1_2_3_hash[:rate_of_turn]}",
         :speed_over_ground_nmea => "#{ais_type1_2_3_hash[:speed_over_ground]}",
         :longitude_nmea => "#{ais_type1_2_3_hash[:longitude]}",
         :latitude_nmea => "#{ais_type1_2_3_hash[:latitude]}",
         :course_over_ground_nmea => "#{ais_type1_2_3_hash[:course_over_ground]}",
         :true_heading_nmea => "#{ais_type1_2_3_hash[:true_heading]}",
         :regional_res_nmea => "#{ais_type1_2_3_hash[:regional_res]}",
         :aivdm_message_nmea => "#{ais_type1_2_3_hash[:aivdm_message].to_s.gsub(/[[:space:]].*/,'')}"
       }]
     )                
  end
  
  ## INSERTING ALL TERMINALS TRACKING DATA
  def insert_all_terminals_tracking_data(
    ais_type1_2_3_hash,
    terminal_id_v,
    db_current_all_terminal_tracking_array
  )

    items = DB[:tmv_terminal_tracking]
    items.insert(
      :mmsi_terminal_tracking => ais_type1_2_3_hash[:mmsi],
      :imo_terminal_tracking => db_current_all_terminal_tracking_array[1],
      :terminal_id_terminal_tracking => terminal_id_v,
      :navig_status_terminal_tracking => ais_type1_2_3_hash[:navig_status],
      :lat_terminal_tracking => ais_type1_2_3_hash[:latitude],
      :lon_terminal_tracking => ais_type1_2_3_hash[:longitude],
      :sog_terminal_tracking => ais_type1_2_3_hash[:speed_over_ground],
      :cog_terminal_tracking => ais_type1_2_3_hash[:course_over_ground],
      :rot_terminal_tracking => ais_type1_2_3_hash[:rate_of_turn],
      :th_terminal_tracking => ais_type1_2_3_hash[:true_heading],
      :eta_ts_terminal_tracking => db_current_all_terminal_tracking_array[4],
      :draught_terminal_tracking => db_current_all_terminal_tracking_array[6],
      :ship_cargo_type_terminal_tracking => db_current_all_terminal_tracking_array[5],
      :destination_terminal_tracking => db_current_all_terminal_tracking_array[7],
      :ts_voyage_terminal_tracking => db_current_all_terminal_tracking_array[8]
    )
  end
  
  ## INSERTING MYVESSEL TRACKING DATA
  def insert_tmv_data(
    ais_type1_2_3_hash,
    myvessels_tracking,
    myvessels_tracking_static,
    myvessels_tracking_voyage,
    myvessels_tracking_current_array,
    vessel_movement
  )

    items = DB[:tmv_myvessel_tracking]
    if myvessels_tracking_static != nil
      items.insert(
        :mmsi_myvessel_tracking => ais_type1_2_3_hash[:mmsi],
        :imo_myvessel_tracking => myvessels_tracking_static[:imo_static_nmea],
        :navig_status_myvessel_tracking => ais_type1_2_3_hash[:navig_status],
        :lon_myvessel_tracking => ais_type1_2_3_hash[:longitude],
        :lat_myvessel_tracking => ais_type1_2_3_hash[:latitude],
        :movement_myvessel_tracking => vessel_movement,
        :sog_myvessel_tracking => ais_type1_2_3_hash[:speed_over_ground],
        :cog_myvessel_tracking => ais_type1_2_3_hash[:course_over_ground],
        :rot_myvessel_tracking => ais_type1_2_3_hash[:rate_of_turn],
        :th_myvessel_tracking => ais_type1_2_3_hash[:true_heading],
        :id_tmv_myvessel_tracking => myvessels_tracking[:id_myvessels],
        :id_area_myvessel_tracking => myvessels_tracking_current_array[1],
        :id_terminal_myvessel_tracking => myvessels_tracking_current_array[2],
        :eta_ts_myvessel_tracking => myvessels_tracking_voyage[:eta_ts_voyage_nmea],
        :draught_myvessel_tracking => myvessels_tracking_voyage[:draught_voyage_nmea],
        :ship_cargo_type_myvessel_tracking => myvessels_tracking_voyage[:ship_cargo_type_voyage_nmea],
        :destination_myvessel_tracking => myvessels_tracking_voyage[:destination_voyage_nmea]
      )
    else
      items.insert(
        :mmsi_myvessel_tracking => ais_type1_2_3_hash[:mmsi],
        :imo_myvessel_tracking => myvessels_tracking[:imo_myvessels],
        :navig_status_myvessel_tracking => ais_type1_2_3_hash[:navig_status],
        :lon_myvessel_tracking => ais_type1_2_3_hash[:longitude],
        :lat_myvessel_tracking => ais_type1_2_3_hash[:latitude],
        :movement_myvessel_tracking => vessel_movement,
        :sog_myvessel_tracking => ais_type1_2_3_hash[:speed_over_ground],
        :cog_myvessel_tracking => ais_type1_2_3_hash[:course_over_ground],
        :rot_myvessel_tracking => ais_type1_2_3_hash[:rate_of_turn],
        :th_myvessel_tracking => ais_type1_2_3_hash[:true_heading],
        :id_tmv_myvessel_tracking => myvessels_tracking[:id_myvessels],
        :id_area_myvessel_tracking => myvessels_tracking_current_array[1],
        :id_terminal_myvessel_tracking => myvessels_tracking_current_array[2],
        :eta_ts_myvessel_tracking => nil,
        :draught_myvessel_tracking => nil,
        :ship_cargo_type_myvessel_tracking => nil,
        :destination_myvessel_tracking => nil
      )
    end
  end
  
  ## INSERTING TYPE 5 STATIC DATA
  def insert_nmea_type5_static_data(ais_type5_hash)
    items = DB[:tmv_static_nmea]
    items.insert(
      :mmsi_static_nmea => ais_type5_hash[:mmsi],
      :callsign_static_nmea => "#{ais_type5_hash[:callsign]}",
      :imo_static_nmea => ais_type5_hash[:imo],
      :name_static_nmea => "#{ais_type5_hash[:name]}",
      :bow_static_nmea => ais_type5_hash[:bow],
      :stern_static_nmea => ais_type5_hash[:stern],
      :port_static_nmea => ais_type5_hash[:port],
      :starboard_static_nmea => ais_type5_hash[:starboard],
      :epfd_static_nmea => ais_type5_hash[:epfd],
      :message_type_static_nmea => ais_type5_hash[:message_type],
      :message1_nmea => "#{ais_type5_hash[:message1].to_s.gsub(/[[:space:]].*/,'')}",
      :message2_nmea => "#{ais_type5_hash[:message2].to_s.gsub(/[[:space:]].*/,'')}"
    )
  end
  
  ## INSERTING TYPE 5 VOYAGE DATA
  def insert_nmea_type5_voyage_data(ais_type5_hash)
    items = DB[:tmv_voyage_nmea]
    items.insert(
      :message_type_voyage_nmea => ais_type5_hash[:message_type],                 
      :mmsi_voyage_nmea => ais_type5_hash[:mmsi],
      :imo_voyage_nmea => ais_type5_hash[:imo],
      :eta_mon_voyage_nmea => ais_type5_hash[:eta_month],
      :eta_d_voyage_nmea => ais_type5_hash[:eta_day],
      :eta_h_voyage_nmea => ais_type5_hash[:eta_hour],
      :eta_min_voyage_nmea => ais_type5_hash[:eta_minute],
      #:eta_ts_voyage_nmea => "#{ais_type5_hash[:eta_timestamp]}",
      :eta_ts_voyage_nmea => nil,
      :draught_voyage_nmea => ais_type5_hash[:draught],
      :ship_cargo_type_voyage_nmea => ais_type5_hash[:ship_cargo_type],
      :destination_voyage_nmea => "#{ais_type5_hash[:destination]}"
    )
  end
  
  ## INSERTING TYPE 5 STATIC DATA IF SHIP STATIC DATA (e.g. NAME, MMSI, CALLSIGN)
  ## HAVE CHANGED
  def insert_tmv_ship_static_data(ais_type5_hash, flag_hash)
    items = DB[:tmv_myvessels_nmea]
    items.insert(
      :name_myvessels => "#{ais_type5_hash[:name]}",
      :ex_name_myvessels => nil,
      :ex_name2_myvessels => nil,
      :ex_name3_myvessels => nil,
      :ex_name4_myvessels => nil,
      :company_myvessels => nil,
      :vessel_type_myvessels => nil,
      :ship_cargo_type_type5_nmea => ais_type5_hash[:cargo_type],
      :mmsi_myvessels => ais_type5_hash[:mmsi],
      :imo_myvessels => ais_type5_hash[:imo],
      :callsign_myvessels => "#{ais_type5_hash[:callsign]}",
      :mt_shipid_myvessels => nil,
      :flag_myvessels => flag_hash[:flag_country],
      :flag_code_myvessels => flag_hash[:flag_country_code],
      :gross_tonnage_myvessels => nil,
      :net_tonnage_myvessels => nil,
      :deadweight_t_myvessels => nil,
      :length_m_myvessels => nil,
      :breadth_m_myvessels => nil,
      :bow_type5_nmea => ais_type5_hash[:bow],
      :stern_type5_nmea => ais_type5_hash[:stern],
      :port_type5_nmea => ais_type5_hash[:port],
      :starboard_type5_nmea => ais_type5_hash[:starboard],
      :year_built_myvessels => nil,
      :home_port_myvessels => nil,
      :testship_myvessels => 'no',  
      :status_myvessels => 'Active'
    )
  end
  
  ## INSERTING TYPE 8 INLAND SHIP DATA
  def insert_nmea_type8_data(ais_type8_d200_f10_hash)
    items = DB[:tmv_type8_nmea]
    items.insert( 
      :message_type8_nmea => ais_type8_d200_f10_hash[:message_type],
      :mmsi_type8_nmea => ais_type8_d200_f10_hash[:mmsi],
      :ev_id_type8_nmea => ais_type8_d200_f10_hash[:european_vessel_id],
      :dim_length_type8_nmea => ais_type8_d200_f10_hash[:dim_length],
      :dim_beam_type8_nmea => ais_type8_d200_f10_hash[:dim_beam],
      :ship_type_type8_nmea => ais_type8_d200_f10_hash[:ship_type],
      :dim_draught_type8_nmea => ais_type8_d200_f10_hash[:dim_draught],
      :haz_cargo_type8_nmea => ais_type8_d200_f10_hash[:haz_cargo_h],
      :load_status_type8_nmea => ais_type8_d200_f10_hash[:load_status]
    )
  end
end
