  #!/usr/bin/env ruby
# encoding: utf-8

require 'sequel'
require 'set'
require 'georuby'

include GeoRuby::SimpleFeatures

#Sequel.database_timezone = :utc
Sequel.database_timezone = :local

## CHECKING IF THE POSITION OF A VESSEL IS INSIDE A TERMINAL AREA

class TerminalTracking

  def initialize(ais_type1_2_3_hash)
    @ais_type1_2_3_hash = ais_type1_2_3_hash
  end

  def check_all_terminals_tracking
  
    point = Point.from_x_y(
      @ais_type1_2_3_hash[:latitude].to_f,
      @ais_type1_2_3_hash[:longitude].to_f
    )

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
        :terminal_lat4, :terminal_lon4
      )
    
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
        terminaltracking_check = true
        terminal_id_v = tdd[:terminal_id].to_i
        terminal_name = tdd[:terminal_name].to_s
        terminal_name_code = tdd[:terminal_name_code].to_s
        terminal_anleger = tdd[:terminal_anleger].to_s
        terminal_betreiber = tdd[:terminal_betreiber].to_s
        if name
          ship_name = name[:name_static_nmea].to_s
        end
      end            
      
      if terminaltracking_check == true
        return terminaltracking_check,
               terminal_id_v,
               terminal_name,
               terminal_name_code,
               terminal_anleger,
               terminal_betreiber

        break
      end
    end
  end
end                              
