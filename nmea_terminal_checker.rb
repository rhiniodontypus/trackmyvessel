#!/usr/bin/env ruby
# encoding: utf-8

require 'sequel'
require 'set'
require 'georuby'

include GeoRuby::SimpleFeatures

#Sequel.database_timezone = :utc
Sequel.database_timezone = :local

class TerminalChecker

  def initialize(ais_type1_2_3_hash)
    @ais_type1_2_3_hash = ais_type1_2_3_hash
  end
  
  def db_terminal_read
  
    ## ARE COORDINATES WITHIN AREA OF INTEREST (TERMINALS, DOCKS etc.)?
    point   = Point.from_x_y(@ais_type1_2_3_hash[:latitude].to_f, 
                             @ais_type1_2_3_hash[:longitude].to_f)
    
    terminal_db_data = DB[:tmv_terminal]
      .select(
        :terminal_id,
        :terminal_name,
        :terminal_name_code,
        :terminal_anleger,
        :terminal_betreiber,
        :terminal_lat1, :terminal_lon1,
        :terminal_lat2, :terminal_lon2,
        :terminal_lat3, :terminal_lon3,
        :terminal_lat4, :terminal_lon4)
    
    name = DB[:tmv_static_nmea]
      .select([:name_static_nmea])
      .where(:mmsi_static_nmea => "#{@ais_type1_2_3_hash[:mmsi]}")
      .order(:last_update_static_nmea)
      .last
    
    terminal_db_data.each do |tdd|
      
      polygon = Polygon.from_coordinates([
        [
          [tdd[:terminal_lat1].to_f,tdd[:terminal_lon1].to_f],
          [tdd[:terminal_lat2].to_f,tdd[:terminal_lon2].to_f],
          [tdd[:terminal_lat3].to_f,tdd[:terminal_lon3].to_f],
          [tdd[:terminal_lat4].to_f,tdd[:terminal_lon4].to_f]
        ]
      ],4326)
      
      if polygon.contains_point?(point) == true
        terminal_db_store = true
        terminal_id_v = tdd[:terminal_id].to_i
        terminal_name = tdd[:terminal_name].to_s
        terminal_name_code = tdd[:terminal_name_code].to_s
        terminal_anleger = tdd[:terminal_anleger].to_s
        terminal_betreiber = tdd[:terminal_betreiber].to_s
        if name
          ship_name = name[:name_static_nmea].to_s
           puts "* TerminalChecker: NAME: #{ship_name}"
        else
          ship_name = "n.a."
          puts "* TerminalChecker: NAME: n.a."
        end
        puts "* TerminalChecker: ANGELEGT!, terminal_db_store: #{terminal_db_store}, terminal_id_v: #{terminal_id_v}"
        puts "* TerminalChecker: MMSI: #{@ais_type1_2_3_hash[:mmsi]}"
        puts "* TerminalChecker: SOG: #{@ais_type1_2_3_hash[:speed_over_ground]}"
        puts "* TerminalChecker: NAVSTAT: #{@ais_type1_2_3_hash[:navig_status]}"
        puts "* TerminalChecker: Terminal-Name: #{tdd[:terminal_name]}"
        puts "* TerminalChecker: Terminal-Anleger: #{tdd[:terminal_anleger]}"
        puts "* TerminalChecker: Terminal-Betreiber: #{terminal_betreiber}"
      end
      
      if terminal_db_store == true
        puts "* TerminalChecker: Ich breake jetzt!"
        return terminal_db_store,
               terminal_id_v,
               terminal_name,
               terminal_name_code,
               terminal_anleger,
               terminal_betreiber
               #, ship_name
        break
      end
    end
    puts
  end
end
