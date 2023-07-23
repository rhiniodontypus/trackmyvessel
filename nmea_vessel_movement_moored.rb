#!/usr/bin/env ruby
# encoding: utf-8

include Math

Radius = 6371  # rough radius of the Earth, in kilometers

class VesselMovement

  def initialize(myvessels_tracking_last_entry_hash, ais_type1_2_3_hash)
    @lat_lon_old = [
      myvessels_tracking_last_entry_hash[:lat],
      myvessels_tracking_last_entry_hash[:lon]
    ]
    @lat_lon_new = [
      ais_type1_2_3_hash[:latitude],
      ais_type1_2_3_hash[:longitude]
    ]
  end
  
  def spherical_distance(start_coords, end_coords)
    lat1, long1 = deg2rad *start_coords
    lat2, long2 = deg2rad *end_coords
    2 * Radius * asin(sqrt(sin((lat2-lat1)/2)**2 + cos(lat1) * cos(lat2) * sin((long2 - long1)/2)**2)) * 1000
  end
  
  def deg2rad(lat, long)
    [lat * PI / 180, long * PI / 180]
  end
  
  def ausgabe
    vessel_movement_moored = "%.1f" % spherical_distance(@lat_lon_old, @lat_lon_new)
  end
end
