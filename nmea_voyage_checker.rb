#!/usr/bin/env ruby
# encoding: utf-8

require 'sequel'
require 'set'

#Sequel.database_timezone = :utc
Sequel.database_timezone = :local

 # CHECKS CURRENT VOYAGE RELATED DATA AGAINST DB DATA
class VoyageDataChecker
  
  def initialize(ais_type5_hash)
    @ais_type5_hash = ais_type5_hash
  end
  
  def db_voyage_data_read(mmsi)
    
    voyage_db_data = DB[:tmv_voyage_nmea]
    .filter(:mmsi_voyage_nmea => "#{mmsi}")
    .select(
      :mmsi_voyage_nmea,
      :eta_mon_voyage_nmea,
      :eta_d_voyage_nmea,
      :eta_h_voyage_nmea,
      :eta_min_voyage_nmea,
      :draught_voyage_nmea,
      :ship_cargo_type_voyage_nmea,
      :destination_voyage_nmea)
    .order(:id_voyage_nmea)
    .last
  
    if voyage_db_data.nil? == true
      database_voyage_store = true
    else
      voyage_db_data_array = [ 
        voyage_db_data[:mmsi_voyage_nmea],
        voyage_db_data[:eta_mon_voyage_nmea], 
        voyage_db_data[:eta_d_voyage_nmea], 
        voyage_db_data[:eta_h_voyage_nmea], 
        voyage_db_data[:eta_min_voyage_nmea], 
        #voyage_db_data[:eta_ts_voyage_nmea], 
        voyage_db_data[:draught_voyage_nmea].to_f,
        voyage_db_data[:ship_cargo_type_voyage_nmea],
        voyage_db_data[:destination_voyage_nmea]
      ]
      
      ais_type5_voyage_array =
        [ 
          @ais_type5_hash[:mmsi],
          @ais_type5_hash[:eta_month],
          @ais_type5_hash[:eta_day],
          @ais_type5_hash[:eta_hour],
          @ais_type5_hash[:eta_minute],
          #@ais_type5_hash[:eta_timestamp],
          @ais_type5_hash[:draught],
          @ais_type5_hash[:ship_cargo_type],
          @ais_type5_hash[:destination]
      ]
  
      if voyage_db_data_array.to_set == ais_type5_voyage_array.to_set
        database_voyage_store = false
      else
        database_voyage_store = true
      end
    end

    return database_voyage_store
  end
end
