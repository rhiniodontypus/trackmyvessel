#!/usr/bin/env ruby
# encoding: utf-8

require 'sequel'

Sequel.database_timezone = :local

## CHECKING IF MAILER SHOULD BE CALLED AND IF YES WHICH BODY SHOULD BE USED

class MailerChecker

  def check_area_range(myvessels_tracking_current_array)
    area_range = DB[:tmv_area_nmea]
      .select(:area_name, :area_range)
      .order(:area_id)
      .where(:area_id => myvessels_tracking_current_array[1])
      .last
    return area_range
  end
  
  ## CHECKING IF SHIP HAS NEWLY ARRIVED IN AREA IN MY PORT
  def check_area_port_status(
    myvessels_tracking_last_array,
    myvessels_tracking_current_array,
    age_last_tracking_data)
    if myvessels_tracking_last_array and
       age_last_tracking_data != nil and
       age_last_tracking_data < 43200
      if myvessels_tracking_last_array[1] == myvessels_tracking_current_array[1]
        port_arrived = false
        port_left = false
      elsif myvessels_tracking_last_array[1] != 6 and
            myvessels_tracking_current_array[1] == 6
        port_arrived = true
        port_left = false
      elsif myvessels_tracking_last_array[1] == 6 and
            myvessels_tracking_current_array[1] != 6
        port_arrived = false
        port_left = true
      end
    else
      port_arrived = nil
      port_left = nil
    end
    return port_arrived, port_left
  end
  
  ## CHECKING IF SHIP HAS ARRIVED AT OR LEFT FROM TERMINAL
  def check_terminal_status(myvessels_tracking_last_array,
                            myvessels_tracking_current_array,
                            age_last_tracking_data,
                            vessel_movement,
                            ais_type1_2_3_hash)
    if myvessels_tracking_last_array and
       age_last_tracking_data != nil and
       age_last_tracking_data < 43200
      if myvessels_tracking_last_array[2] == myvessels_tracking_current_array[2]
        terminal_left = false
        terminal_arrived = false
      elsif myvessels_tracking_last_array[2] != nil and
            myvessels_tracking_current_array[2] == nil and
            vessel_movement >= 200 and
            ais_type1_2_3_hash[:speed_over_ground] != 0
        terminal_left = true
        terminal_arrived = false
      elsif myvessels_tracking_last_array[2] == nil and
            myvessels_tracking_current_array[2] != nil
        terminal_left = false
        terminal_arrived = true
      end
    else
      terminal_left = nil
      terminal_arrived = nil
    end
    return terminal_left, terminal_arrived
  end
  

  def check_mail_myvessels(
    ais_type1_2_3_hash,
    myvessels_tracking_static,
    myvessels_tracking_voyage,
    vessel_movement,
    static_voyage_data_exist,
    age_voyage_data,
    myvessels_tracking_current_array,
    myvessels_tracking_last_array,
    tracking_last_entry_exist,
    myvessels_tracking_last_entry,
    myvessels_tracking_last_position_hash,
    age_last_tracking_data,
    age_2nd_last_tracking_data,
    area_range, port_arrived,
    port_left,
    terminal_left,
    terminal_arrived
  )
  
  ## CREATING ETA TIMESTAMP
  t = Time.now.utc
  t_year = t.year
  eta_utc_ts_temp = Time.utc(
    t_year,
     myvessels_tracking_voyage[:eta_mon_voyage_nmea],
     myvessels_tracking_voyage[:eta_d_voyage_nmea],
     myvessels_tracking_voyage[:eta_h_voyage_nmea],
     myvessels_tracking_voyage[:eta_min_voyage_nmea]
  )
  interval = eta_utc_ts_temp - t
	
	## IF ETA TS - CURRENT TS IS OLDER THAN 90 DAYS, YEAR IS NEXT YEAR
	if interval < -7776000
		t_year = t.year + 1
	end
	eta_utc_ts = Time.utc(
    t_year,
    myvessels_tracking_voyage[:eta_mon_voyage_nmea],
    myvessels_tracking_voyage[:eta_d_voyage_nmea],
    myvessels_tracking_voyage[:eta_h_voyage_nmea],
    myvessels_tracking_voyage[:eta_min_voyage_nmea]
  )

	if interval < 0
		interval = interval * -1
		past = true
	end
	
	days = (interval / 86400)
	hours = ((interval-(86400.0 * days.to_i)) / 3600.0)
	minutes = (((interval-(86400.0 * days.to_i))-3600.0 * hours.to_i)/60.0)
	seconds = ((((interval-(86400.0 * days.to_i))-3600.0 * hours.to_i)-60.0 * minutes.to_i))
	
	if seconds >= 30
		minutes = minutes + 1
	end
	
	if past == true
		time_to_eta = " (Zeit nach ETA: #{days.to_i}T #{hours.to_i}H #{minutes.to_i}M)"
	else
		time_to_eta = " (Zeit bis ETA: #{days.to_i}T #{hours.to_i}H #{minutes.to_i}M)"
	end
	
    ## LAST TRACKING EXISTS
    if tracking_last_entry_exist == true
      ## VESSEL OUTSIDE MY PORT AREA
      if myvessels_tracking_last_array[1] != 6
        if port_arrived == false
          if age_2nd_last_tracking_data != nil and age_2nd_last_tracking_data < 43200
            call_mailer = false
          elsif age_2nd_last_tracking_data == nil or age_2nd_last_tracking_data >= 43200
            call_mailer = true
            if age_voyage_data == nil or age_voyage_data >= 43200
              body_status = <<-END
Code 1
Das Schiff befindet sich jetzt
im Bereich: #{area_range[:area_range]} (vermutlich Richtung mein Hafen)
Aktuelle Reisedaten (< 12 Stunden) liegen nicht vor, werden aber nachgereicht sobald verfügbar.
              END
            elsif age_voyage_data != nil and age_voyage_data < 43200
              body_status = <<-END
Code 2
Das Schiff befindet sich jetzt
im Bereich: #{area_range[:area_range]}
Ziel:       #{myvessels_tracking_voyage[:destination_voyage_nmea]}
ETA:        #{eta_utc_ts}#{time_to_eta}
              END
            end
          end
        
        elsif port_arrived == true
          
          call_mailer = true
          
          if age_voyage_data == nil or age_voyage_data >= 43200
            body_status = <<-END
Code 3
Das Schiff hat soeben das Hafengebiet erreicht!
Bereich:    #{area_range[:area_range]}
Aktuelle Reisedaten (< 12 Stunden) liegen nicht vor, werden aber nachgereicht sobald verfügbar.
            END
          elsif age_voyage_data != nil and age_voyage_data < 43200
            body_status = <<-END
Code 4
Das Schiff hat soeben das Hafengebiet erreicht!
Bereich:    #{area_range[:area_range]}
Ziel:       #{myvessels_tracking_voyage[:destination_voyage_nmea]}
ETA:        #{eta_utc_ts}#{time_to_eta}
            END
          end
        end

      ## SHIP IS ONLY RECORDED HERE IF IT WAS ALREADY IN PORT BEFORE AND IS 
      ## CURRENTLY STILL IN PORT
      elsif myvessels_tracking_last_array[1] == 6 and
            myvessels_tracking_current_array[1] == 6
        
        ## TERMINAL: LEFT
        if terminal_left == true
       
          call_mailer = true
          terminal = DB[:tmv_terminal]
            .select(
              :terminal_name, 
              :terminal_anleger,
              :terminal_name_code,
              :terminal_betreiber
            )
          .order(:terminal_id)
          .where(:terminal_id => myvessels_tracking_last_array[2])
          .last
          
          # Code A-1: NEW TRACKING DATA, NEW VOYAGE DATA, VESSEL JUST LEFT TERMINAL
          if age_voyage_data != nil and age_voyage_data < 43200
            body_status = <<-END
Code A-1
Das Schiff befindet sich im
Bereich:    #{area_range[:area_range]}
Terminal:   soeben von #{terminal[:terminal_name]} abgelegt
Ziel:       #{myvessels_tracking_voyage[:destination_voyage_nmea]}
ETA:        #{eta_utc_ts}#{time_to_eta}
            END
          elsif age_voyage_data == nil or age_voyage_data >= 43200
            # Code A-2: NEW TRACKING DATA, OLD VOYAGE DATA, VESSEL JUST LEFT TERMINAL
            body_status = <<-END
Code A-2
Das Schiff befindet sich im
Bereich:    #{area_range[:area_range]}
Terminal:   soeben von #{terminal[:terminal_name]} abgelegt
Aktuelle Reisedaten (< 12 Stunden) liegen nicht vor, werden aber nachgereicht sobald verfügbar.
            END
          end
        
        ## TERMINAL: ARRIVED
        elsif terminal_arrived == true

          call_mailer = true
          terminal = DB[:tmv_terminal]
            .select(
              :terminal_name,
              :terminal_anleger,
              :terminal_name_code,
              :terminal_betreiber
            )
            .order(:terminal_id)
            .where(:terminal_id => myvessels_tracking_current_array[2])
            .last
          
          # Code B-1: NEW TRACKING DATA, NEW VOYAGE DATA, VESSEL HAS JUST REACHED TERMINAL
          if age_voyage_data != nil and age_voyage_data < 43200
            body_status = <<-END
Code B-1
Das Schiff befindet sich im
Bereich:    #{area_range[:area_range]} und hat gerade den Terminalbereich erreicht.
Terminal:   #{terminal[:terminal_name]} (#{terminal[:terminal_betreiber]}) 
Anleger:    #{terminal[:terminal_anleger]}
Ziel:       #{myvessels_tracking_voyage[:destination_voyage_nmea]}
ETA:        #{eta_utc_ts}#{time_to_eta}
            END
          elsif age_voyage_data == nil or age_voyage_data > 43200
            # Code B-2: NEW TRACKING DATA, OLD VOYAGE DATA, HAS JUST REACHED TERMINAL
            body_status = <<-END
Code B-2
Das Schiff befindet sich im
im Bereich: #{area_range[:area_range]} und hat gerade den Terminalbereich erreicht.
Terminal:   #{terminal[:terminal_name]} (#{terminal[:terminal_betreiber]}) 
Anleger:    #{terminal[:terminal_anleger]}
Aktuelle Reisedaten (< 12 Stunden) liegen nicht vor, werden aber nachgereicht sobald verfügbar.
            END
          end
        
        ## TERMINAL: YES
        elsif myvessels_tracking_current_array[2] != nil and
              myvessels_tracking_current_array[2] != myvessels_tracking_last_array[2]
        terminal = DB[:tmv_terminal]
          .select(
            :terminal_name,
            :terminal_anleger,
            :terminal_name_code,
            :terminal_betreiber
          )
          .order(:terminal_id)
          .where(:terminal_id => myvessels_tracking_current_array[2])
          .last

          ## VOYAGE DATA: NEW
          if age_voyage_data != nil and age_voyage_data < 43200
            ## 2nd TRACKING DATA: NEW
            if age_2nd_last_tracking_data != nil and age_2nd_last_tracking_data < 43200
              call_mailer = false
            ## 2nd TRACKING DATA: NIL OR OLD
            elsif age_2nd_last_tracking_data == nil or age_2nd_last_tracking_data >= 43200
              call_mailer = true
              body_status = <<-END
Code C-1
Das Schiff befindet sich im
Bereich:    #{area_range[:area_range]}
Terminal:   #{terminal[:terminal_name]} (#{terminal[:terminal_betreiber]}) 
Anleger:    #{terminal[:terminal_anleger]}
Ziel:       #{myvessels_tracking_voyage[:destination_voyage_nmea]}
ETA:        #{eta_utc_ts}#{time_to_eta}
              END
            end
          ## VOYAGE DATA: OLD
          elsif age_voyage_data == nil or age_voyage_data >= 43200
            if age_last_tracking_data < 43200
              call_mailer = false
            else age_last_tracking_data >= 43200
              call_mailer = true
              body_status = <<-END
Code C-2
Das Schiff befindet sich im
Bereich:    #{area_range[:area_range]}
Terminal:   #{terminal[:terminal_name]} (#{terminal[:terminal_betreiber]}) 
Anleger:    #{terminal[:terminal_anleger]}
Aktuelle Reisedaten (< 12 Stunden) liegen nicht vor, werden aber nachgereicht sobald verfügbar.
              END
            end  
          end
        
        ## TERMINAL: NO
        elsif myvessels_tracking_current_array[2] == nil
        
          ## VOYAGE DATA: NEW
          if age_voyage_data != nil and age_voyage_data < 43200
            ## 2nd TRACKING DATA: NEW
            if age_2nd_last_tracking_data != nil and age_2nd_last_tracking_data < 43200
              call_mailer = false
            ## 2nd TRACKING DATA: NIL OR OLD
            elsif age_2nd_last_tracking_data == nil or age_2nd_last_tracking_data >= 43200
              call_mailer = true
              body_status = <<-END
Code D-1
Das Schiff befindet sich im
Bereich:    #{area_range[:area_range]}
Terminal:   -
Ziel:       #{myvessels_tracking_voyage[:destination_voyage_nmea]}
ETA:        #{eta_utc_ts}#{time_to_eta}
              END
            end
          ## VOYAGE DATA: NIL OR OLD
          elsif age_voyage_data == nil or age_voyage_data >= 43200
            if age_last_tracking_data < 43200
              call_mailer = false
            else age_last_tracking_data >= 43200
              call_mailer = true
              body_status = <<-END
Code D-2
Das Schiff befindet sich im
Bereich:    #{area_range[:area_range]}
Terminal:   -
Aktuelle Reisedaten (< 12 Stunden) liegen nicht vor, werden aber nachgereicht sobald verfügbar.
age_voyage_data   #{age_voyage_data}
              END
            end
          end
        end
      end
        
    ## LAST TRACKING DOES NOT EXIST
    elsif tracking_last_entry_exist == false
      call_mailer = true
      
      ## AREA: INSIDE PORT MY PORT
      if myvessels_tracking_current_array[1] == 6
        
          ## TERMINAL: YES
          if myvessels_tracking_current_array[2] != nil
            terminal = DB[:tmv_terminal]
              .select(
                :terminal_name,
                :terminal_anleger,
                :terminal_name_code,
                :terminal_betreiber
              )
              .order(:terminal_id)
              .where(:terminal_id => myvessels_tracking_current_array[2])
              .last
            
            ## VOYAGE DATA: NEW
            if age_voyage_data != nil and age_voyage_data < 43200
              body_status = <<-END
Code E-1
Das Schiff wird zum ersten Mal beobachtet und befindet sich im
Bereich:    #{area_range[:area_range]}
Terminal:   #{terminal[:terminal_name]} (#{terminal[:terminal_betreiber]}) 
Anleger:    #{terminal[:terminal_anleger]}
Ziel:       #{myvessels_tracking_voyage[:destination_voyage_nmea]}
ETA:        #{eta_utc_ts}#{time_to_eta}
              END
            ## VOYAGE DATA: NIL OR OLD
            elsif age_voyage_data == nil or age_voyage_data >= 43200
              body_status = <<-END
Code E-2
Das Schiff wird zum ersten Mal beobachtet und befindet sich im
Bereich:    #{area_range[:area_range]}
Terminal:   #{terminal[:terminal_name]} (#{terminal[:terminal_betreiber]}) 
Anleger:    #{terminal[:terminal_anleger]}
Aktuelle Reisedaten (< 12 Stunden) liegen nicht vor, werden aber nachgereicht sobald verfügbar.
            END
            end
        
          ## TERMINAL: NO
          elsif myvessels_tracking_current_array[2] == nil
        
            ## VOYAGE DATA: NEW
            if age_voyage_data != nil and age_voyage_data < 43200
              body_status = <<-END
Code F-1
Das Schiff wird zum ersten Mal beobachtet und befindet sich im
Bereich:    #{area_range[:area_range]}
Terminal:   -
Ziel:       #{myvessels_tracking_voyage[:destination_voyage_nmea]}
ETA:        #{eta_utc_ts}#{time_to_eta}
              END
            ## VOYAGE DATA: NIL OR OLD
            elsif age_voyage_data == nil or age_voyage_data >= 43200
              body_status = <<-END
Code F-2
Das Schiff wird zum ersten Mal beobachtet und befindet sich im
Bereich:    #{area_range[:area_range]}
Terminal:   -
Aktuelle Reisedaten (< 12 Stunden) liegen nicht vor, werden aber nachgereicht sobald verfügbar.
              END
            end
          end
      
        ## AREA: OUTSIDE PORT MY PORT
      elsif myvessels_tracking_current_array[1] != 6
        ## VOYAGE DATA: NEW
        if age_voyage_data != nil and age_voyage_data < 43200
          body_status = <<-END
Code G-1
Das Schiff wird zum ersten Mal beobachtet und befindet sich im
Bereich:    #{area_range[:area_range]}
Ziel:       #{myvessels_tracking_voyage[:destination_voyage_nmea]}
ETA:        #{eta_utc_ts} - #{time_to_eta}
          END
        ## VOYAGE DATA: NIL OR OLD
        elsif age_voyage_data == nil or age_voyage_data >= 43200
          body_status = <<-END
Code G-2
Das Schiff wird zum ersten Mal beobachtet und befindet sich im
Bereich:    #{area_range[:area_range]}
Aktuelle Reisedaten (< 12 Stunden) liegen nicht vor, werden aber nachgereicht sobald verfügbar.
          END
        end 
      end
    end
  return call_mailer, body_status
  end
end
