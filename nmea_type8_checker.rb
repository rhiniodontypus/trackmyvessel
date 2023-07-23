#!/usr/bin/env ruby
# encoding: utf-8

require 'sequel'
require 'set'

#Sequel.database_timezone = :utc
Sequel.database_timezone = :local

# CHECKS CURRENT VOYAGE RELATED DATA AGAINST DB DATA

class Type8DataChecker
  
  def initialize(ais_type8_d200_f10_hash)
    @ais_type8_d200_f10_hash = ais_type8_d200_f10_hash
  end
  
  def db_type8_data_read(mmsi)
    type8_db_data = DB[:tmv_type8_nmea]
      .filter(:mmsi_type8_nmea => "#{mmsi}")
      .select(
        :mmsi_type8_nmea,
        :ev_id_type8_nmea,
        :dim_length_type8_nmea,
        :dim_beam_type8_nmea,
        :ship_type_type8_nmea,
        :dim_draught_type8_nmea,
        :haz_cargo_type8_nmea,
        :load_status_type8_nmea
      )
      .order(:id_type8_nmea)
      .last
    
    if type8_db_data.nil? == true
      database_type8_store = true
    else
      db_type8_data_array = [ 
        type8_db_data[:mmsi_type8_nmea],
        type8_db_data[:ev_id_type8_nmea],
        if type8_db_data[:dim_length_type8_nmea] #!= nil 
          type8_db_data[:dim_length_type8_nmea].to_f
        else  
          type8_db_data[:dim_beam_type8_nmea]
        end,
        if type8_db_data[:dim_beam_type8_nmea] #!= nil 
          type8_db_data[:dim_beam_type8_nmea].to_f
        else  
          type8_db_data[:dim_beam_type8_nmea]
        end,
        type8_db_data[:ship_type_type8_nmea], 
        if type8_db_data[:dim_draught_type8_nmea] #!= nil 
          type8_db_data[:dim_draught_type8_nmea].to_f
        else  
          type8_db_data[:dim_draught_type8_nmea]
        end, 
        type8_db_data[:haz_cargo_type8_nmea],
        type8_db_data[:load_status_type8_nmea]
        ]
      
      ais_type8_array = [ 
        @ais_type8_d200_f10_hash[:mmsi],
        @ais_type8_d200_f10_hash[:european_vessel_id],
        if @ais_type8_d200_f10_hash[:dim_length] #!= nil 
            @ais_type8_d200_f10_hash[:dim_length]
          else  
            @ais_type8_d200_f10_hash[:dim_length]
        end,
        if @ais_type8_d200_f10_hash[:dim_beam] #!= nil 
            @ais_type8_d200_f10_hash[:dim_beam].to_f
          else  
            @ais_type8_d200_f10_hash[:dim_beam]
        end,
        @ais_type8_d200_f10_hash[:ship_type], 
        if @ais_type8_d200_f10_hash[:dim_draught] #!= nil 
            @ais_type8_d200_f10_hash[:dim_draught].to_f
          else  
            @ais_type8_d200_f10_hash[:dim_draught]
        end,
        @ais_type8_d200_f10_hash[:haz_cargo_h],
        @ais_type8_d200_f10_hash[:load_status]
        ]
                              
       ## CORRECTS THE BEAM/LENGTH ERROR FROM THE AIS SIGNAL, WHERE THE SUM OF 
       ## THE TWO IS MOSTLY CORRECT, BUT THE TWO VALUES DIFFER BY + 0.1 AND 
       ## - 0.1 RESPECTIVELY.
      
      if @ais_type8_d200_f10_hash[:dim_beam] and
        if @ais_type8_d200_f10_hash[:dim_length]
          dimension_type8_ais = (@ais_type8_d200_f10_hash[:dim_length].to_f + 
            @ais_type8_d200_f10_hash[:dim_beam].to_f)
        end
      end
      
      if type8_db_data[:dim_beam_type8_nmea] and
        if type8_db_data[:dim_length_type8_nmea]
          dimension_type8_hash = (type8_db_data[:dim_length_type8_nmea].to_f +
            type8_db_data[:dim_beam_type8_nmea].to_f)
        end
      end
      
      if dimension_type8_ais and
        if dimension_type8_hash
          dim_type8_quotient = dimension_type8_ais / dimension_type8_hash
        end
      end
      
      if db_type8_data_array.to_set == ais_type8_array.to_set
        database_type8_store = false
      elsif  dim_type8_quotient.to_f.between?(0.8, 1.2) == true or
        dim_type8_quotient.to_f != 0.0
        database_type8_store = false
      else
        database_type8_store = true
      end
    end

    return database_type8_store
  end
end
