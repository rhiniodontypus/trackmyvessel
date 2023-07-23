#!/usr/bin/env ruby
# encoding: utf-8

require 'sequel'
require 'date'

#Sequel.database_timezone = :utc
Sequel.database_timezone = :local

## PREPARING MAIL HEADER AND BODY

class MailTemplate

  def ts_conversion_utc_local(ais_type1235_hash)
    mmsi_mailtemplate = ais_type1235_hash[:mmsi]
    last_update_db = DB[:tmv_position_report_wo_increment_nmea]
      .select(:last_update_nmea)
      .order(:mmsi_nmea)
      .where(:mmsi_nmea => "#{mmsi_mailtemplate}")
      .last

    last_update_v = last_update_db[:last_update_nmea]
    t = Time.local("#{last_update_v.strftime("%Y")}",
                   "#{last_update_v.strftime("%m")}",
                   "#{last_update_v.strftime("%d")}",
                   "#{last_update_v.strftime("%H")}",
                   "#{last_update_v.strftime("%M")}",
                   "#{last_update_v.strftime("%S")}")
    local_time = t
    time_meldung = "#{local_time.strftime("%e")}"+"."+\
                   "#{local_time.strftime("%m")}"+"."+\
                   "#{local_time.strftime("%Y")}"+" "+\
                   "#{local_time.strftime("%H")}"+":"+\
                   "#{local_time.strftime("%M")}"+" Uhr"+" "+\
                   "(#{local_time.strftime("%Z")})"

    return time_meldung, mmsi_mailtemplate
  end
  
  def age_last_update(myvessels_tracking_voyage)
    if myvessels_tracking_voyage
      age_voyage_data = (
        (DateTime.now.to_time - myvessels_tracking_voyage[:last_update_voyage_nmea])
      ).round

    else
      age_voyage_data = nil
    end
    return age_voyage_data
  end
  
  def body_header(ais_type1_2_3_hash,
                  myvessels_tracking,
                  myvessels_tracking_static,
                  myvessels_tracking_voyage,
                  time_meldung)
    
    ## CHECKING IF CURRENT NAME EXISTS (-> WITH CURRENT MMSI)
    if myvessels_tracking_static.nil? == false
      name_v = myvessels_tracking_static[:name_static_nmea]
    else 
      name_v = myvessels_tracking[:name_myvessels]
    end
    
    ## GETTING MMSI AND IMO
    mmsi_mailtemplate = ais_type1_2_3_hash[:mmsi]
    if myvessels_tracking_static.nil? == false
      imo_v = myvessels_tracking_static[:imo_static_nmea]
    else
      imo_v = myvessels_tracking[:imo_myvessels]
    end
    
    ## GETTING FLAG
    flag_mailtemplate = ais_type1_2_3_hash[:flag]
    flagcountry_db = DB[:tmv_midflagcodes_nmea]
      .select(:country_midflagcodes_nmea)
      .order(:id_midflagcodes_nmea)
      .where(:mid_midflagcode_nmea => "#{flag_mailtemplate}")
      .last

    flag_country_v = flagcountry_db[:country_midflagcodes_nmea]
    
    ## GET SHIPPING COMPANY
    if myvessels_tracking[:company_myvessels].nil? == false
      ship_company_v = myvessels_tracking[:company_myvessels]
    else
      ship_company_v = "Neues Schiff. Die Reederei muss noch ergänzt werden."
    end

body_v_header = <<-END
************************************************************************
*           ANKÜNDIGUNG EINES SCHIFFS IN MEINEM HAFEN           *
*             Meldung vom #{time_meldung}             *
************************************************************************

–––––––––––––
SCHIFFSDATEN
–––––––––––––

NAME:      #{name_v}
MMSI:      #{mmsi_mailtemplate}
IMO:       #{imo_v}
FLAGGE:    #{flag_country_v}
REEDEREI:  #{ship_company_v}

END
  return body_v_header
  end
  
  def body_status_method(ais_type1_2_3_hash,
                         myvessels_tracking_voyage,
                         age_voyage_data,
                         body_status)
  ## ETA/DESTINATION/LAST UPDATE
    if myvessels_tracking_voyage and age_voyage_data < 43200
      puts "* MailTemplate - body_status_method: age_voyage_data: " \
           "#{age_voyage_data} für MMSI #{ais_type1_2_3_hash[:mmsi]}"
           
      ts_eta = Time.at(myvessels_tracking_voyage[:eta_ts_voyage_nmea].to_i)
      eta_mail = ("#{ts_eta.strftime("%^b")}" + " " + "
                   #{ts_eta.strftime("%d")}" + " 
                   #{ts_eta.strftime("%H")}" + ":" + "
                   #{ts_eta.strftime("%M")}" + 
                   " UTC")
      dest_mail = myvessels_tracking_voyage[:destination_voyage_nmea]
      last_update_mail = myvessels_tracking_voyage[:last_update_voyage_nmea]
    else
      eta_mail = "n.a"
      dest_mail = "n.a."
      last_update_mail = "n.a."
    end
    lat_mailtemplate = ais_type1_2_3_hash[:latitude]
    lon_mailtemplate = ais_type1_2_3_hash[:longitude]
  
  body_v_status = <<-END
–––––––––––––––––––––––––––––––
AKTUELLE SITUATION DES SCHIFFS
–––––––––––––––––––––––––––––––

#{body_status}
Zeitpunkt der letzten Reisedaten: #{last_update_mail}

https://www.openstreetmap.org/#map=16/#{lat_mailtemplate}/#{lon_mailtemplate}

  END
  return body_v_status
  end
  
  #def body_last_ports
  #end
  
  def body_ship_position(ais_type1_2_3_hash)
  body_v_ship_position = <<-END
–––––––––––––––––––––––––––––––––––––
LINKS ZUR AKTUELLEN SCHIFFSPOSITION
–––––––––––––––––––––––––––––––––––––

MARINETRAFFIC
https://www.marinetraffic.com/de/ais/details/ships/mmsi:#{ais_type1_2_3_hash[:mmsi]}
VESSELFINDER
http://www.vesselfinder.com/?mmsi=#{ais_type1_2_3_hash[:mmsi]}
  END
  return body_v_ship_position
  end
  
  ## UPDATING STATIC DATA FROM TYPE 5 MESSAGE
  def mailtemplate_update_myvessel(ais_type5_hash, time_meldung, mmsi_mailtemplate)
    ## GET OLD STATIC TMV ENTRY
    old_static_data = DB[:tmv_myvessels_nmea]
      .select(
        :mmsi_myvessels, 
        :callsign_myvessels, 
        :imo_myvessels, 
        :name_myvessels
      )
     .order(:id_myvessels)
     .where(:imo_myvessels => ais_type5_hash[:imo])
     .limit(1, 1)
     .last


    puts "* MailTemplate - mailtemplate_update_myvessel - old_static_data: #{old_static_data}"
    puts "* MailTemplate - mailtemplate_update_myvessel - old_static_data: " +
     "#{old_static_data.inspect}"

    old_mmsi = old_static_data[:mmsi_myvessels]
    old_callsign = old_static_data[:callsign_myvessels]
    old_name = old_static_data[:name_myvessels]
    
    flag_mailtemplate_old = old_static_data[:mmsi_myvessels].to_s.match(/^[[:digit:]]{3}/)
    old_flag = DB[:tmv_midflagcodes_nmea]
      .select(:country_midflagcodes_nmea, :alpha2_midflagcode_nmea)
      .order(:id_midflagcodes_nmea)
      .where(:mid_midflagcode_nmea => "#{flag_mailtemplate_old}")
      .last
 
    imo_v = ais_type5_hash[:imo]
    name_v = ais_type5_hash[:name]
    callsign_v = ais_type5_hash[:callsign]
    
    ship_company_db = DB[:tmv_myvessels_nmea]
      .select(:company_myvessels)
      .order(:id_myvessels)
      .where(:mmsi_myvessels => "#{ais_type5_hash[:mmsi]}")
      .last
    ship_company_v = ship_company_db[:company_myvessels]
    
    flag_mailtemplate_current = ais_type5_hash[:mmsi].to_s.match(/^[[:digit:]]{3}/)
    current_flag = DB[:tmv_midflagcodes_nmea]
      .select(
        :country_midflagcodes_nmea,
        :alpha2_midflagcode_nmea)
      .order(:id_midflagcodes_nmea)
      .where(:mid_midflagcode_nmea => "#{flag_mailtemplate_current}")
      .last

    body_v = <<-END
************************************************************************
*             UPDATE EINES SCHIFFS IN DER DATENBANK                *
*             Meldung vom #{time_meldung}              *
************************************************************************

Eines meiner Schiffe hat neue, statische Daten gesendet, die von den vorherig
gespeicherten abweichen. Dies kann MMSI/FLAGGE, NAME oder CALLSIGN
betreffen.

––––––––––––––––––––––––––
AKTUALISIERTE SCHIFFSDATEN
––––––––––––––––––––––––––

NAME alt:       #{old_name}
NAME neu:       #{name_v}

MMSI alt:       #{old_mmsi}
MMSI neu:       #{mmsi_mailtemplate}

CALLSIGN alt:   #{old_callsign}
CALLSIGN neu:   #{callsign_v}

FLAGGE alt:     #{old_flag[:country_midflagcodes_nmea]} (#{old_flag[:alpha2_midflagcode_nmea]})
FLAGGE neu:     #{current_flag[:country_midflagcodes_nmea]} (#{current_flag[:alpha2_midflagcode_nmea]})

IMO:            #{imo_v}
REEDEREI:       #{ship_company_v}

MARINETRAFFIC
https://www.marinetraffic.com/de/ais/details/ships/mmsi:#{mmsi_mailtemplate}
VESSELFINDER
http://www.vesselfinder.com/?mmsi=#{mmsi_mailtemplate}
    END
  return body_v
  end
end
