#!/usr/bin/env ruby
# encoding: utf-8

require 'sequel'
require 'set'

#Sequel.database_timezone = :utc
Sequel.database_timezone = :local

# CHECKS CURRENT STATIC RELATED DATA AGAINST DB DATA

class StaticDataChecker
  
  def initialize(ais_type5_hash)
    @ais_type5_hash = ais_type5_hash
  end
  
  def db_static_data_epfd18_read(mmsi, epfd_v)

    static_db_data = DB[:tmv_static_nmea]
      .where(:mmsi_static_nmea => "#{mmsi}", :epfd_static_nmea => 1..8)
      .order(:id_static_nmea)
      .last
    
    if static_db_data.nil? == true
      database_static_store = true
    end

      static_db_data_array = [ 
        static_db_data[:mmsi_static_nmea],
        static_db_data[:callsign_static_nmea], 
        static_db_data[:imo_static_nmea],
        static_db_data[:name_static_nmea],
        static_db_data[:bow_static_nmea], 
        static_db_data[:stern_static_nmea],
        static_db_data[:port_static_nmea], 
        static_db_data[:starboard_static_nmea],
        static_db_data[:epfd_static_nmea]
       ]
      
      ais_type5_static_array = [ 
        @ais_type5_hash[:mmsi],
        @ais_type5_hash[:callsign],
        @ais_type5_hash[:imo],
        @ais_type5_hash[:name],
        @ais_type5_hash[:bow],
        @ais_type5_hash[:stern],
        @ais_type5_hash[:port],
        @ais_type5_hash[:starboard],
        @ais_type5_hash[:epfd]
      ]
                            
      # THEN THE EPFD VALUES OF BOTH ARRAYS ARE BETWEEN 1 AND 8
      if static_db_data_array.to_set == ais_type5_static_array.to_set
        database_static_store = false
      elsif static_db_data_array.to_set != ais_type5_static_array.to_set and
        static_db_data[:epfd_static_nmea].between?(1, 8) == false
        database_static_store = true
      end
    return database_static_store
  end
  
  def db_static_data_epfd015_read(mmsi, epfd_v)

    static_db_data = DB[:tmv_static_nmea]
      .where(:mmsi_static_nmea => "#{mmsi}")
      .order(:id_static_nmea)
      .last
    
    ## VESSEL PRESENT IN DB?
    if static_db_data.nil? == true
      database_static_store = true
    else
      database_static_store = false
    end
    
    return database_static_store
  end
end
