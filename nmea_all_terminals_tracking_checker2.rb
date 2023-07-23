#!/usr/bin/env ruby
# encoding: utf-8

require 'sequel'
require 'set'
require 'date'

#Sequel.database_timezone = :utc
Sequel.database_timezone = :local

## CHECKING CURRENT TERMINAL STATIC RELATED DATA AGAINST DB DATA

class TerminalTrackingChecker
  
  def initialize(ais_type1_2_3_hash)
    @ais_type1_2_3_hash = ais_type1_2_3_hash
  end

  def db_all_terminal_tracking_data(mmsi, terminal_id_v)
  
    db_last_all_terminal_tracking = DB[:tmv_terminal_tracking]
      .select(
        :mmsi_terminal_tracking,
        :imo_terminal_tracking,
        :terminal_id_terminal_tracking,
        :navig_status_terminal_tracking,
        :movement_terminal_tracking,
        :eta_ts_terminal_tracking,
        :ship_cargo_type_terminal_tracking,
        :draught_terminal_tracking,
        :destination_terminal_tracking,
        :ts_voyage_terminal_tracking,
        :last_update_terminal_tracking
      )
      .order(:id_terminal_tracking)
      .where(:mmsi_terminal_tracking => mmsi)
      .last
                                   
    if db_last_all_terminal_tracking.nil? == false
         db_last_all_terminal_tracking_array = 
          [
            db_last_all_terminal_tracking[:mmsi_terminal_tracking], 
            db_last_all_terminal_tracking[:imo_terminal_tracking],
            db_last_all_terminal_tracking[:terminal_id_terminal_tracking],
            db_last_all_terminal_tracking[:navig_status_terminal_tracking],
            db_last_all_terminal_tracking[:eta_ts_terminal_tracking],
            db_last_all_terminal_tracking[:ship_cargo_type_terminal_tracking],
            db_last_all_terminal_tracking[:draught_terminal_tracking],
            db_last_all_terminal_tracking[:destination_terminal_tracking],
            db_last_all_terminal_tracking[:ts_voyage_terminal_tracking]
          ]
      age_db_last_all_terminal_tracking = (
        DateTime.now.to_time - db_last_all_terminal_tracking[:last_update_terminal_tracking]
      ).round
    else
      db_last_all_terminal_tracking_array = [nil,nil,nil,nil,nil,nil,nil,nil,nil]
      age_db_last_all_terminal_tracking = nil
    end
      
    ## GET CURRENT TERMINAL/VOYAGE DATA FROM ais_type1_2_3_hash AND LATEST VOYAGE DATA
    db_voyage_terminal_tracking = DB[:tmv_voyage_nmea]
      .select(
        :mmsi_voyage_nmea, 
        :imo_voyage_nmea,
        :eta_ts_voyage_nmea,
        :draught_voyage_nmea,
        :ship_cargo_type_voyage_nmea,
        :destination_voyage_nmea,
        :last_update_voyage_nmea
      )
      .order(:last_update_voyage_nmea)
      .where(:mmsi_voyage_nmea => mmsi)
      .last
    
    ## IF PREVIOUS VOYAGE DATA ARE AVAILABLE 
    if db_voyage_terminal_tracking
      age_last_update_voyage_nmea = (
        DateTime.now.to_time - db_voyage_terminal_tracking[:last_update_voyage_nmea]
      ).round
      ## ONLY USE VOYAGE DATA NOT OLDER THAN 7 DAYS
      if age_last_update_voyage_nmea <= 604800
    
        db_current_all_terminal_tracking_array = [
          @ais_type1_2_3_hash[:mmsi],
          db_voyage_terminal_tracking[:imo_voyage_nmea],
          terminal_id_v,
          @ais_type1_2_3_hash[:navig_status],
          db_voyage_terminal_tracking[:eta_ts_voyage_nmea],
          db_voyage_terminal_tracking[:ship_cargo_type_voyage_nmea],
          db_voyage_terminal_tracking[:draught_voyage_nmea],
          db_voyage_terminal_tracking[:destination_voyage_nmea],
          db_voyage_terminal_tracking[:last_update_voyage_nmea]
        ]
      ## IF OLDER => SET ONLY MMSI, TERMINAL ID AND NAVIG STATUS
      else
        db_current_all_terminal_tracking_array = [
          @ais_type1_2_3_hash[:mmsi],
          nil,
          terminal_id_v,
          @ais_type1_2_3_hash[:navig_status],
          nil,
          nil,
          nil,  
          nil,
          nil
        ]
      end
    ## IF NO PREVIOUS DATA ARE AVAILABLE ALSO SET ONLY MMSI,
    ## TERMINAL ID AND NAVIG STATUS
    else
      age_last_update_voyage_nmea = nil
    
      db_current_all_terminal_tracking_array = [
        @ais_type1_2_3_hash[:mmsi],
        nil,
        terminal_id_v,
        @ais_type1_2_3_hash[:navig_status],
        nil,
        nil,
        nil,
        nil,
        nil
      ]
    end
    
    ## DB STORE IF EITHER ARRAYS DO NOT MATCH OR IF LAST TRACKING IS OLDER THAN 
    ## 12 HOURS OR IF IT IS FIRST RECORD IN DB,
    ## EXCLUDING CERTAIN SHIP TYPES (20..34, 36, 37, 50, 52, 53, 60, 69)
    if (db_voyage_terminal_tracking and
       db_voyage_terminal_tracking[:ship_cargo_type_voyage_nmea].between?(20,34) == false and
       db_voyage_terminal_tracking[:ship_cargo_type_voyage_nmea].between?(36,37) == false and
       db_voyage_terminal_tracking[:ship_cargo_type_voyage_nmea] != 50 and
       db_voyage_terminal_tracking[:ship_cargo_type_voyage_nmea].between?(52,53) == false and
       db_voyage_terminal_tracking[:ship_cargo_type_voyage_nmea] != 60 and
       db_voyage_terminal_tracking[:ship_cargo_type_voyage_nmea] != 69)

      if (db_last_all_terminal_tracking_array.to_set !=
            db_current_all_terminal_tracking_array.to_set) or
          age_db_last_all_terminal_tracking >= 43200 or
          db_last_all_terminal_tracking.nil? == true
        terminaltracking_store = true
      else
        terminaltracking_store = false
      end
    elsif db_voyage_terminal_tracking.nil? == true
      if (db_last_all_terminal_tracking_array.to_set != 
            db_current_all_terminal_tracking_array.to_set) or
          age_db_last_all_terminal_tracking >= 43200 or
          db_last_all_terminal_tracking.nil? == true
        terminaltracking_store = true
      else
        terminaltracking_store = false
      end
    end

    return terminaltracking_store,
           db_last_all_terminal_tracking_array,
           db_current_all_terminal_tracking_array
  end
end
