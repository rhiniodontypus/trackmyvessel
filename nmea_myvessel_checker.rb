#!/usr/bin/env ruby
# encoding: utf-8

require 'sequel'
require 'set'
require 'date'
require_relative 'nmea_vessel_movement_moored.rb'
require_relative 'nmea_area_checker.rb'
require_relative 'nmea_terminal_checker.rb'
require_relative './config/DB_CONNECT.rb'

Sequel.database_timezone = :local

class MyVesselChecker

  ## PREPARING LIST OF MMSIs TO CHECK NMEA-TYPE1-DATASTREAM FOR TMV SHIPS, SWITCH
  ## FOR TESTSHIPS (ONLY REAL MYVESSELS: testship_myvessels == no)
  
  def myvessels_mmsi_db_read
    myvessels_list_db = DB[:tmv_myvessels_nmea]
      .select(:mmsi_myvessels)
      .where(:status_myvessels => 'Active', :testship_myvessels => 'no')
    mmsi_list_myvessels = myvessels_list_db.map(:mmsi_myvessels)
    return mmsi_list_myvessels
  end
  
  ## PREPARING LIST OF IMOs TO COMPARE STATIC DATA OF TMV SHIPS FROM 
  ## tmv_static_nmea WITH CURRENT NMEA-TYPE5-DATASTREAM
  def myvessels_imo_db_read
    myvessels_list_db = DB[:tmv_myvessels_nmea]
      .select(:imo_myvessels)
      .where(:status_myvessels => 'Active')
    imo_list_myvessels = myvessels_list_db.map(:imo_myvessels)
    return imo_list_myvessels
  end
  
  def myvessels_static_voyage_data_exists(ais_type1_2_3_hash)
    myvessels_tracking_static = DB[:tmv_static_nmea]
      .select(
        :imo_static_nmea, 
        :name_static_nmea,
        :last_update_static_nmea
      )
      .order(:id_static_nmea)
      .where(:mmsi_static_nmea => ais_type1_2_3_hash[:mmsi])
      .last

    myvessels_tracking_voyage = DB[:tmv_voyage_nmea]
      .select(
        :eta_mon_voyage_nmea,
  			:eta_d_voyage_nmea,
  			:eta_h_voyage_nmea,
  			:eta_min_voyage_nmea,
  			:eta_ts_voyage_nmea,
  			:draught_voyage_nmea,
  			:ship_cargo_type_voyage_nmea,
  			:destination_voyage_nmea,
  			:last_update_voyage_nmea
      )
      .order(:id_voyage_nmea)
      .where(:mmsi_voyage_nmea => ais_type1_2_3_hash[:mmsi])
      .last
    
    if myvessels_tracking_static and myvessels_tracking_voyage
      static_voyage_data_exist = true
      age_voyage_data = (
        (DateTime.now.to_time - myvessels_tracking_voyage[:last_update_voyage_nmea]).round
      )
    else
      static_voyage_data_exist = false
      age_voyage_data = nil
    end
    return myvessels_tracking_static, myvessels_tracking_voyage, 
    static_voyage_data_exist, age_voyage_data
  end
  
  def myvessels_tracking_data_exists(ais_type1_2_3_hash)
    myvessels_tracking_last_entry = DB[:tmv_myvessel_tracking]
      .select(
        :navig_status_myvessel_tracking,
        :lat_myvessel_tracking,
        :lon_myvessel_tracking,
        :id_area_myvessel_tracking,
        :id_terminal_myvessel_tracking,
        :eta_ts_myvessel_tracking,
        :draught_myvessel_tracking,
        :ship_cargo_type_myvessel_tracking,
        :destination_myvessel_tracking,
        :last_update_myvessel_tracking
      )
      .order(:id_myvessel_tracking)
      .where(:mmsi_myvessel_tracking => ais_type1_2_3_hash[:mmsi])
      .last

    if myvessels_tracking_last_entry
      tracking_last_entry_exist = true
      
      myvessels_tracking_last_array = 
        [
          myvessels_tracking_last_entry[:navig_status_myvessel_tracking],
          myvessels_tracking_last_entry[:id_area_myvessel_tracking],
          myvessels_tracking_last_entry[:id_terminal_myvessel_tracking],
          myvessels_tracking_last_entry[:eta_ts_myvessel_tracking],
          myvessels_tracking_last_entry[:draught_myvessel_tracking],
          myvessels_tracking_last_entry[:ship_cargo_type_myvessel_tracking],
          myvessels_tracking_last_entry[:destination_myvessel_tracking]
      ]
      
      myvessels_tracking_last_position_hash = 
        {
          lat: myvessels_tracking_last_entry[:lat_myvessel_tracking].to_f,
          lon: myvessels_tracking_last_entry[:lon_myvessel_tracking].to_f
     }

      ## CHECKING AGE OF ENTRIES
      age_last_tracking_data = 
        (DateTime.now.to_time - myvessels_tracking_last_entry[:last_update_myvessel_tracking]).round

      myvessels_tracking_2nd_last_entry = DB[:tmv_myvessel_tracking]
        .select(
          :navig_status_myvessel_tracking,
          :lat_myvessel_tracking,
          :lon_myvessel_tracking,
          :id_area_myvessel_tracking,
          :id_terminal_myvessel_tracking,
          :eta_ts_myvessel_tracking,
          :draught_myvessel_tracking,
          :ship_cargo_type_myvessel_tracking,
          :destination_myvessel_tracking,
          :last_update_myvessel_tracking
        )
        .order(:id_myvessel_tracking)
        .where(:mmsi_myvessel_tracking => ais_type1_2_3_hash[:mmsi])
        .limit(1, 1)
        .last

      if myvessels_tracking_2nd_last_entry != nil
        age_2nd_last_tracking_data = 
        (DateTime.now.to_time - myvessels_tracking_2nd_last_entry[:last_update_myvessel_tracking]).round
      else
        age_2nd_last_tracking_data = nil
      end
    else
      tracking_last_entry_exist = false
      myvessels_tracking_last_array = [nil, nil, nil, nil, nil, nil, nil]
      myvessels_tracking_last_position_hash = {lat: nil, lon: nil}
      age_last_tracking_data = nil
      age_2nd_last_tracking_data = nil
    end
    return myvessels_tracking_last_entry, myvessels_tracking_last_array, 
    myvessels_tracking_last_position_hash, tracking_last_entry_exist, 
    age_last_tracking_data, age_2nd_last_tracking_data
  end
  
  def myvessels_tracking_current_data(
    ais_type1_2_3_hash,
    myvessels_tracking_static,
    myvessels_tracking_voyage,
    static_voyage_data_exist,
    age_voyage_data,
    myvessels_tracking_last_entry,
    myvessels_tracking_last_array,
    myvessels_tracking_last_position_hash,
    tracking_last_entry_exist,
    age_last_tracking_data
  )
    
    myvessels_tracking = DB[:tmv_myvessels_nmea]
      .select(
        :id_myvessels,
        :name_myvessels,
        :imo_myvessels,
        :company_myvessels)
      .order(:id_myvessels)
      .where(:mmsi_myvessels => ais_type1_2_3_hash[:mmsi])
      .last
    
    if static_voyage_data_exist == true
      current_name = myvessels_tracking_static[:name_static_nmea]
      current_imo = myvessels_tracking_static[:imo_static_nmea]
      current_company = myvessels_tracking[:company_myvessels]
    else
      current_name = myvessels_tracking[:name_myvessels]
      current_imo = myvessels_tracking[:imo_myvessels]
      current_company = myvessels_tracking[:company_myvessels]
    end
    
    ## MYVESSEL MY AREA
    area = AreaChecker.new(ais_type1_2_3_hash)
    if tracking_last_entry_exist == true
      current_area_id = area.db_current_area_read
      last_area_id = area.db_last_area_read(myvessels_tracking_last_position_hash)
    else
      current_area_id = area.db_current_area_read
    end
    
    ## MYVESSEL ID TERMINAL
    if current_area_id == 6
      terminal = TerminalChecker.new(ais_type1_2_3_hash)
      
      terminal_db_store, terminal_id_v, terminal_name, terminal_name_code,
      terminal_anleger, terminal_betreiber = terminal.db_terminal_read
    else
      terminal_id_v = nil
    end
   
    ## CREATING ARRAY CURRENT DATA
    if myvessels_tracking_voyage
      myvessels_tracking_current_array = 
        [
          ais_type1_2_3_hash[:navig_status],#.to_i,
          current_area_id,
          terminal_id_v,
          myvessels_tracking_voyage[:eta_ts_voyage_nmea],
          myvessels_tracking_voyage[:draught_voyage_nmea],#.to_f,
          myvessels_tracking_voyage[:ship_cargo_type_voyage_nmea],#.to_i,
          myvessels_tracking_voyage[:destination_voyage_nmea]#.to_s
      ]
    else
      myvessels_tracking_current_array = 
        [
          ais_type1_2_3_hash[:navig_status],#.to_i,
          current_area_id,
          terminal_id_v,
          nil,
          nil,
          nil,
          nil
      ]
    end
                                              
    ## CALCULATING VESSEL MOVEMENT
    if tracking_last_entry_exist == true
      move = VesselMovement.new(myvessels_tracking_last_position_hash, ais_type1_2_3_hash)
      vessel_movement = move.ausgabe.to_f.round
    else
      vessel_movement = nil
    end
  
    ## CREATING STORE CONDITIONS
    if tracking_last_entry_exist == true
      if current_area_id == 6
        if terminal_id_v != nil
          if (vessel_movement > 50 or 
              myvessels_tracking_last_array.to_set != myvessels_tracking_current_array.to_set or
              age_last_tracking_data > 43200)
            database_tmv_store = true
          else
            database_tmv_store = false
          end
        elsif terminal_id_v == nil
          if ((vessel_movement > 300 and age_last_tracking_data > 300) or
               myvessels_tracking_last_array.to_set != myvessels_tracking_current_array.to_set)
            database_tmv_store = true
          else
            database_tmv_store = false
          end
        end
      elsif current_area_id != 6
        if ((vessel_movement > 300 and age_last_tracking_data > 300) or
             myvessels_tracking_last_array.to_set != myvessels_tracking_current_array.to_set)
          database_tmv_store = true
        else
          database_tmv_store = false
        end
      end
    elsif tracking_last_entry_exist == false
      database_tmv_store = true
    end
  return myvessels_tracking,
         myvessels_tracking_current_array,
         database_tmv_store,
         vessel_movement
  end
  
  ## TYPE 5: ADDING NEW ENTRY FOR SHIP TO STATIC DATABASE IF NAME, MMSI OR 
  ##CALLSIGN HAS CHANGED
  def myvessels_list_db_read(ais_type5_hash)

    myvessels_list_db = DB[:tmv_myvessels_nmea]
      .select(
        :name_myvessels,
        :mmsi_myvessels,
        :imo_myvessels,
        :callsign_myvessels
      )
      .order(:id_myvessels)
      .where(:imo_myvessels => ais_type5_hash[:imo])
      .last

    myvessels_list_db_array = [
                                    myvessels_list_db[:name_myvessels].to_s,
                                    myvessels_list_db[:mmsi_myvessels].to_i,
                                    myvessels_list_db[:imo_myvessels].to_i  ,
                                    myvessels_list_db[:callsign_myvessels].to_s,
                                    ]

    ais_type5_myvessels_array = [
                                      ais_type5_hash[:name],
                                      ais_type5_hash[:mmsi],
                                      ais_type5_hash[:imo],
                                      ais_type5_hash[:callsign]
                                      ]

    if ((myvessels_list_db_array.to_set == ais_type5_myvessels_array.to_set) or
        ais_type5_hash[:imo] == 0)
      database_myvessels_store = false
    else
      database_myvessels_store = true
      
      ## EXTRACTING COUNTRY/FLAG CODE FROM CURRENT MMSI
      flag_myvessel_checker = ais_type5_hash[:mmsi].to_s.match(/^[[:digit:]]{3}/)
      flagcountry_db = DB[:tmv_midflagcodes_nmea]
        .select(
          :country_midflagcodes_nmea,
          :alpha2_midflagcode_nmea
        )
        .order(:id_midflagcodes_nmea)
        .where(:mid_midflagcode_nmea => "#{flag_myvessel_checker}")
        .last
    
      flag_hash = {
        flag_country: flagcountry_db[:country_midflagcodes_nmea], 
        flag_country_code: flagcountry_db[:alpha2_midflagcode_nmea]
      }
    end
  return database_myvessels_store, myvessels_list_db, flag_hash
  end
end
