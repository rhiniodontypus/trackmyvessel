#!/usr/bin/env ruby
# encoding => utf-8

require 'sequel'

class LastShipPosition
 
  def call_last_shipposition(mmsi)

    last_shipposition_db = DB[:tmv_position_report_wo_increment_nmea]
      .select(
        :navig_status_nmea,
        :latitude_nmea,
        :longitude_nmea,
        :last_update_nmea
      )
      .order(:mmsi_nmea)
      .where(:mmsi_nmea => "#{mmsi}")
      .last
     
    if last_shipposition_db
      last_shipposition_hash = { 
        last_shipposition_hash_navig_status: last_shipposition_db[:navig_status_nmea],
        last_shipposition_hash_lat: last_shipposition_db[:latitude_nmea].to_f,
        last_shipposition_hash_lon: last_shipposition_db[:longitude_nmea].to_f,
        last_shipposition_hash_last_update: last_shipposition_db[:last_update_nmea]
      }
    end
     
  return last_shipposition_hash
  end
end
