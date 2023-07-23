#!/usr/bin/env ruby
# encoding: utf-8

require 'sequel'
require 'set'
require 'georuby'

include GeoRuby::SimpleFeatures

#Sequel.database_timezone = :utc
Sequel.database_timezone = :local

class AreaChecker

  def initialize(ais_type1_2_3_hash)
      @ais_type1_2_3_hash = ais_type1_2_3_hash
  end

  def db_current_area_read
    
    ## ARE COORDINATES WITHIN AREA OF INTEREST (TERMINALS, DOCKS etc.)?
    current_point = (
      Point.from_x_y(@ais_type1_2_3_hash[:latitude].to_f, 
      @ais_type1_2_3_hash[:longitude].to_f)
    )
    
    area_db_data = DB[:tmv_area_nmea]
      .select(
        :area_id,
        :area_name,
        :area_range,
        :area_lat1, :area_lon1,
        :area_lat2, :area_lon2,
        :area_lat3, :area_lon3,
        :area_lat4, :area_lon4,
        :area_lat5, :area_lon5,
        :area_lat6, :area_lon6
      )

    area_db_data.each do |add|
      polygon = Polygon.from_coordinates([
        [
          [add[:area_lat1].to_f,add[:area_lon1].to_f],
          [add[:area_lat2].to_f,add[:area_lon2].to_f],
          [add[:area_lat3].to_f,add[:area_lon3].to_f],
          [add[:area_lat4].to_f,add[:area_lon4].to_f],
          [add[:area_lat5].to_f,add[:area_lon5].to_f],
          [add[:area_lat6].to_f,add[:area_lon6].to_f]
        ]
      ], 4326)
      
      if polygon.contains_point?(current_point) == true
        current_area_id = add[:area_id].to_i
        return current_area_id
        break
      end
    end
  end

  def db_last_area_read(myvessels_tracking_last_position_hash)
    
    ## ARE COORDINATES WITHIN AREA OF INTEREST (TERMINALS, DOCKS etc.)?
    last_point = (
      Point.from_x_y(myvessels_tracking_last_position_hash[:lat].to_f,
      myvessels_tracking_last_position_hash[:lon].to_f)
    )
    
    area_db_data = DB[:tmv_area_nmea]
     .select(
      :area_id,
      :area_name,
      :area_range,
      :area_lat1, :area_lon1,
      :area_lat2, :area_lon2,
      :area_lat3, :area_lon3,
      :area_lat4, :area_lon4,
      :area_lat5, :area_lon5,
      :area_lat6, :area_lon6
    )
  
    area_db_data.each do |add|
      polygon = Polygon.from_coordinates([
        [
          [add[:area_lat1].to_f,add[:area_lon1].to_f],
          [add[:area_lat2].to_f,add[:area_lon2].to_f],
          [add[:area_lat3].to_f,add[:area_lon3].to_f],
          [add[:area_lat4].to_f,add[:area_lon4].to_f],
          [add[:area_lat5].to_f,add[:area_lon5].to_f],
          [add[:area_lat6].to_f,add[:area_lon6].to_f]
        ]
      ], 4326)
        
      if polygon.contains_point?(last_point) == true
        last_area_id = add[:area_id].to_i
        return last_area_id
        break
      end
    end
  end
end
