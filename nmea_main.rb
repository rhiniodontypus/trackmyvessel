#!/usr/bin/env ruby
# encoding: utf-8

require 'socket'
require 'nmea_plus'
require 'mail'
#require 'stringio'	# MAY BE NECESSARY IF THE UDP STREAM CANNOT BE READ

# MESSAGE TYPE 1/2/3 METHODS
require_relative 'nmea_get_type123_messages.rb'
require_relative 'nmea_last_shipposition_checker.rb'

# MESSAGE TYPE 5 METHODS
require_relative 'nmea_get_type5_messages.rb'
require_relative 'nmea_static_checker'
require_relative 'nmea_voyage_checker'

# MESSAGE OTHER TYPE METHODS
require_relative 'nmea_get_type8_messages.rb'
require_relative 'nmea_type8_checker'
# require_relative 'nmea_get_type18_messages.rb'
# require_relative 'nmea_get_type19_messages.rb'
# require_relative 'nmea_get_type24_messages.rb'
# #require_relative 'nmea_get_type27_messages.rb'

# MY VESSLES METHODS
require_relative 'nmea_all_terminals_tracking_checker'
require_relative 'nmea_all_terminals_tracking_checker2.rb'
require_relative 'nmea_myvessel_checker'

# MAILER METHODS
require_relative 'nmea_mailer_checker.rb'
require_relative 'nmea_mail_template.rb'
#require_relative './config/nmea_mailer.rb'
require_relative './temp/nmea_mailer_jessi.rb'

# DATABASE METHODS
require_relative 'nmea_database_store.rb'
require_relative './config/DB_CONNECT.rb'

class Main
  def initialize(port)
    @port = port
  end

  def udp_connect
    
    ## IPv4 SOCKET
    @socket = UDPSocket.new
    @socket.bind('<IPv4>', @port)
    ## IPv6 SOCKET
    # @socket = UDPSocket.new(Socket::AF_INET6)
    # @socket.bind('<IPv6>', @port)

    while line = @socket.gets

      begin
      
        ## ERROR HANDLING
        foo = StringIO.new 
        $stdout = foo

          ## EXAMPLE: !AIVDM,1,1,,B,139NVn?P00PcVSjNcqILCgwR2000,0*01
          if /^!AIVDM,1,1.*/.match(line)

            io_source = StringIO.new("#{line}")
            source_decoder = NMEAPlus::SourceDecoder.new(io_source)

            source_decoder.each_complete_message do |message|

              if message.all_checksums_ok? == true &&
                   message.all_messages_received? == true
                
                if "AIVDM" == message.data_type
                  message_type = GetType123Messages.new
                  type, rep_ind, mmsi, flag = message_type.aivdm_message_type(message)
                  type = message.ais.message_type

                  ## SKIPPING AIS BINARY MESSAGES TYPE 6, 8, 9, 12, 14, 15, 21, 27
                  ## ONLY MESSAGE TYPES 1/2/3 AND 5 ARE RELEVANT
                  next if type == 6 or
                          type == 8 or
                          type == 9 or
                          type == 12 or
                          type == 14 or
                          type == 15 or
                          type == 19 or
                          type == 21 or
                          type == 27                     
                                
                  mmsi = message.ais.source_mmsi
                  
                  ## CHECKING IF MMSI NUMBER IS PLAUSIBLE (>= 9 DIGITS)
                  next if mmsi.to_s.length < 9
                  
                  if type == 1 or type == 2 or type == 3
                 
                    puts
                    puts "CHECKING TYPE 1/2/3 MESSAGE"
                    puts line
                  
                    ## CHECKING IF AIVDM MESSAGE 1/2/3 IS PLAUSIBLE (= 47 DIGITS)
                    ## DIFFERENT LENGTH 49 NECESSARY FOR UNKNOWN REASON AS AIVDM-
                    ## MESSAGE IS STILL 47
                    next if message.to_s.length != 49

                    message_position = GetType123Messages.new

                    puts "MMSI #{mmsi}: Extracting position report data."

                    status, turn, sog, lon, lat, cog,
                    true_headingh_v, timestamp, maneuvre =
                    message_position.aivdm_type123_position(message)

                    ## SKIPPING FALSE POSITIONAL INFORMATION
                    next if lat > 90 or lon > 180

                    ais_type1_2_3_hash = { 
                      message_type: type,
                      mmsi: mmsi,
                      flag: flag,
                      navig_status: status,
                      rate_of_turn: turn,
                      speed_over_ground: sog,
                      longitude: lon,
                      latitude: lat,
                      course_over_ground: cog,
                      true_heading: true_headingh_v,
                      timestamp: timestamp,
                      regional_res: maneuvre,
                      aivdm_message: line
                    }
                  
                    ## READING LAST ENTRY OF SHIP POSITION
                    last_ship_db = LastShipPosition.new
                    last_shipposition_hash = last_ship_db.call_last_shipposition(mmsi)

                    puts "MMSI #{mmsi}: Storing current position."

                    ## STORE CURRENT SHIP POSITION IN DATABASE (OVERWRITES LAST ENTRY OF SHIP POSITION)
                    database = DatabaseStore.new(mmsi)
                    database.insert_nmea_type123_data(ais_type1_2_3_hash)

                    puts "MMSI #{mmsi}: Checking presence at terminal."

                    ## CHECKING IF VESSEL IS AT TERMINAL
                    terminal_tracker = TerminalTracking.new(ais_type1_2_3_hash)

                    terminaltracking_check,
                    terminal_id_v,
                    terminal_name,
                    terminal_name_code,
                    terminal_anleger,
                    terminal_betreiber =
                    terminal_tracker.check_all_terminals_tracking

                    if terminaltracking_check == true

                      ## CHECKING CURRENT TERMINAL STATIC RELATED DATA AGAINST PREVIOUS DB DATA
                      terminal_tracking_checker = TerminalTrackingChecker.new(ais_type1_2_3_hash)

                      terminaltracking_store,
                      db_last_all_terminal_tracking_array,
                      db_current_all_terminal_tracking_array =
                      terminal_tracking_checker.db_all_terminal_tracking_data(mmsi, terminal_id_v)

                      if terminaltracking_store == true
                        database = DatabaseStore.new(mmsi)
                        database.insert_all_terminals_tracking_data(
                          ais_type1_2_3_hash,
                          terminal_id_v,
                          db_current_all_terminal_tracking_array
                        )
                      end
                    end

                    puts "MMSI #{mmsi}: Checking if tracked vessel is at terminal."

                    ## CHECKING IF CURRENT MMSI BELONGS TO A TRACKED VESSEL
                    mmsilist = MyVesselChecker.new
                    mmsi_list_myvessels = mmsilist.myvessels_mmsi_db_read

                    ## CHECKING EXISTENCE OF OLD ENTRIES FOR 
                    ## STATIC/VOYAGE/TRACKING AND AREA/TERMINAL/LAST POSITION
                    if mmsi_list_myvessels.include?(mmsi) == true
                      check_tmv = MyVesselChecker.new
                      
                      ## CHECKING EXISTENCE OF STATIC AND VOYAGE DATA
                      myvessels_tracking_static,
                      myvessels_tracking_voyage,
                      static_voyage_data_exist,
                      age_voyage_data = 
                      check_tmv.myvessels_static_voyage_data_exists(ais_type1_2_3_hash)

                      ## CHECKING EXISTENCE OF LAST TRACKING DATA
                      myvessels_tracking_last_entry,
                      myvessels_tracking_last_array,
                      myvessels_tracking_last_position_hash,
                      tracking_last_entry_exist,
                      age_last_tracking_data,
                      age_2nd_last_tracking_data =
                      check_tmv.myvessels_tracking_data_exists(ais_type1_2_3_hash)

                      ## READING CURRENT TRACKING DATA
                      myvessels_tracking, myvessels_tracking_current_array,
                      database_tmv_store, vessel_movement = 
                      check_tmv.myvessels_tracking_current_data(
                        ais_type1_2_3_hash,
                        myvessels_tracking_static,
                        myvessels_tracking_voyage,
                        static_voyage_data_exist,
                        age_voyage_data,
                        myvessels_tracking_last_entry,
                        myvessels_tracking_last_array,
                        myvessels_tracking_last_position_hash,
                        tracking_last_entry_exist,
                        age_last_tracking_data
                      )

                      if database_tmv_store == true

                        database = DatabaseStore.new(mmsi)
                        
                        database.insert_tmv_data(
                          ais_type1_2_3_hash,
                          myvessels_tracking,
                          myvessels_tracking_static,
                          myvessels_tracking_voyage,
                          myvessels_tracking_current_array,
                          vessel_movement
                        )

                        puts "MMSI #{mmsi}: Checking for mailer condition."

                        mailer_check = MailerChecker.new
                        
                        area_range = mailer_check.check_area_range(myvessels_tracking_current_array)
                        port_arrived, port_left = mailer_check.check_area_port_status(
                          myvessels_tracking_last_array,
                          myvessels_tracking_current_array,
                          age_last_tracking_data
                        )
                        
                        terminal_left, terminal_arrived = mailer_check.check_terminal_status(
                          myvessels_tracking_last_array,
                          myvessels_tracking_current_array,
                          age_last_tracking_data,
                          vessel_movement, ais_type1_2_3_hash
                        )
                        
                        call_mailer, body_status = mailer_check.check_mail_myvessels(
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
                           port_left, terminal_left,
                           terminal_arrived
                        )
                      end

                      if call_mailer == true
                      
                        puts "MMSI #{mmsi}: New vessel information. Mailer is called."

                        mailtemplate = MailTemplate.new
                        time_meldung, mmsi_mailtemplate = mailtemplate.ts_conversion_utc_local(ais_type1_2_3_hash)
                        age_voyage_data = mailtemplate.age_last_update(myvessels_tracking_voyage)
                        body_v_header = mailtemplate.body_header(
                          ais_type1_2_3_hash, myvessels_tracking,
                          myvessels_tracking_static,
                          myvessels_tracking_voyage,
                          time_meldung
                        )
                        body_v_status = mailtemplate.body_status_method(
                          ais_type1_2_3_hash,
                          myvessels_tracking_voyage,
                          age_voyage_data,
                          body_status
                        )
                        puts body_v_status

                        body_v_ship_position = mailtemplate.body_ship_position(ais_type1_2_3_hash)
                        body_v = "#{body_v_header}#{body_v_status}#{body_v_ship_position}"
                    
                        ## CALL MAILER
                        mailer = Mailer.new
                        mailer.maildefaults
                        mailer.maildelivery(body_v)
                      end
                    end

                  # elsif type == 8
                  #   dac = message.ais.designated_area_code
                  #   fid = message.ais.functional_id
                  #   # puts "* Main - type 8 condition: DAC: #{dac}, FID: #{fid}"
                    
                  #   if dac == 200 and fid == 10

                  #     message_voyage = GetType8Messages.new

                  #     ev_id, dim_length, dim_beam, ship_type, dim_draught_v,
                  #     haz_cargo_v, load_status_v = 
                  #     message_voyage.aivdm_type8_position(message)
                      
                  #     ais_type8_d200_f10_hash = { 
                  #       message_type: type,
                  #       mmsi: mmsi,
                  #       european_vessel_id: ev_id,
                  #       dim_length: dim_length,
                  #       dim_beam: dim_beam,
                  #       ship_type: ship_type,
                  #       #ship_type_description,
                  #       dim_draught: dim_draught_v,
                  #       haz_cargo_h: haz_cargo_v,
                  #       #haz_cargo_desc,
                  #       load_status: load_status_v,
                  #       #load_status_desc_v,
                  #       #speed_qual,
                  #       #course_qual,
                  #       #heading_qual 
                  #     }
                    
                  #     db_type8_check = Type8DataChecker.new(ais_type8_d200_f10_hash)
                  #     database_type8_store = db_type8_check.db_type8_data_read(mmsi)
                  #     if database_type8_store == true
                  #       database = DatabaseStore.new(mmsi)
                  #       database.insert_nmea_type8_data(ais_type8_d200_f10_hash)
                  #     end  
                  #   end
                  end
                end
              end
            end
          end

          ## EVALUATION OF AIS TYPE 5 DATA
          if /^!AIVDM,2,1.*/.match(line)
            type5 = GetType5Messages.new
            input1 = type5.aivdm_2_1(line)
          end
          
          if /^!AIVDM,2,2.*/.match(line)
            type5 = GetType5Messages.new
            input2 = type5.aivdm_2_2(line)
            
            io_source = StringIO.new("#{input1}\n#{input2}")                                  
            source_decoder = NMEAPlus::SourceDecoder.new(io_source)
            source_decoder.each_complete_message do |message|
            
              if message.all_checksums_ok? == true &&
                message.all_messages_received? == true
                
                if "AIVDM" == message.data_type
                  message_type_5 = GetType5Messages.new

                  type, rep_ind, mmsi = message_type_5.aivdm_message_type(message)
                  
                  if type == 5

                    puts "MMSI #{mmsi}: Extracting static and voyage report data."
                    
                    imo_v, callsign_v, name_v, ship_cargo_type_v, 
                    ship_cargo_type_desc_v, sd_bow, sd_stern, sd_port, 
                    sd_starboard, eta_month_v, eta_day_v, eta_hour_v, eta_minute_v,
                    eta_timestamp_v, epfd_v, draught_v, dest_v =
                    message_type_5.aivdm_type5_static(message)
                    
                    ## SHIP STATIC DATA
                    ais_type5_hash = {
                      message1: input1,
                      message2: input2,
                      message_type: type,
                      mmsi: mmsi,
                      callsign: callsign_v,
                      imo: imo_v,
                      name: name_v,
                      ship_cargo_type: ship_cargo_type_v,
                      bow: sd_bow, 
                      stern: sd_stern,
                      port: sd_port,
                      starboard: sd_starboard,
                      eta_month: eta_month_v,
                      eta_day: eta_day_v,
                      eta_hour: eta_hour_v,
                      eta_minute: eta_minute_v,
                      eta_timestamp: eta_timestamp_v,
                      epfd: epfd_v,
                      draught: draught_v,
                      destination: dest_v
                    }

                    puts "MMSI #{mmsi}: Checking static and voyage DB entries."

                    ## DATABASE CHECKER / STORER - CHECKING IF SHIP IS ALREADY IN VOYAGE DB
                    db_voyage_check = VoyageDataChecker.new(ais_type5_hash)
                    database_voyage_store = db_voyage_check.db_voyage_data_read(mmsi)
                    if database_voyage_store == true
                      database = DatabaseStore.new(mmsi)
                      database.insert_nmea_type5_voyage_data(ais_type5_hash)
                    end
                                      
                    ## DATABASE CHECKER / STORER - CHECKING IF SHIP IS ALREADY IN STATIC DB
                    db_static_check = StaticDataChecker.new(ais_type5_hash)

                    ## ELECTRONIC POSITION FIXING DEVICE: CHECKS IF POSITION FIX 
                    ## TYPE VALUE IS BETWEEN 1 AND 8 => SATELLITE POSITIONING ACTIVE,
                    ## IF 0 OR >= 9 (USUALLY 15) NOT ACTIVE
                    if epfd_v.between?(1, 8) == true
                      database_static_store = db_static_check.db_static_data_epfd18_read(mmsi, epfd_v)
                      if database_static_store == true  
                        database = DatabaseStore.new(mmsi)
                        database.insert_nmea_type5_static_data(ais_type5_hash)
                      end
                    elsif epfd_v == 0 or epfd_v >= 9
                      database_static_store = db_static_check.db_static_data_epfd015_read(mmsi, epfd_v)
                      if database_static_store == true
                        database = DatabaseStore.new(mmsi)
                        database.insert_nmea_type5_static_data(ais_type5_hash)
                      end
                    end

                    puts "MMSI #{mmsi}: Checking static vessel information (MMSI, flag, name, callsign)."

                    ## UPDATING STATIC DATA IN CASE A TRACKED VESSEL HAS NEW MMSI/FLAG, 
                    ## NAME OR CALLSIGN AND SENDS OUT AN E-MAIL
                    myvessel_exists = MyVesselChecker.new
                    imo_list_myvessels = myvessel_exists.myvessels_imo_db_read
                    
                    if imo_list_myvessels.include?(ais_type5_hash[:imo]) == true

                      database_myvessels_store, myvessels_list_db, flag_hash = 
                      myvessel_exists.myvessels_list_db_read(ais_type5_hash)
                      
                      if database_myvessels_store == true
                        database2 = DatabaseStore.new(mmsi)
                        database2.insert_tmv_ship_static_data(ais_type5_hash, flag_hash)
                        
                        ## MAIL NOTIFICATION WHEN A TRACKED VESSEL GETS UPDATED
                        template_tmv_update = MailTemplate.new
                        
                        time_meldung, mmsi_mailtemplate = 
                        template_tmv_update.ts_conversion_utc_local(ais_type5_hash)
                        
                        body_v = template_tmv_update.mailtemplate_update_myvessel(
                          ais_type5_hash,
                          time_meldung,
                          mmsi_mailtemplate
                        )

                        ## CALL MAILER
                        mailer = Mailer.new
                        mailer.maildefaults
                        mailer.maildelivery(body_v)
                      end
                    end
                  end
                else
                  next  
                end
              end
            end
          end
        STDOUT.puts $stdout.string
      rescue StandardError => error # begin
        $stdout.string
        STDOUT.puts $stdout.string # output on screen
        File.open("./log/errors/errors.log", 'a') do |file|
          file.write(
            "\n\n–––––––––––––––––––––––––––––––––––\n\n" \
            "Error from #{Time.now}:\n” #{error}\n" \
            "Standard output:\n#{$stdout.string}\n" \
            "Backtrace:\n#{error.backtrace.join("\n")}\n"
          )
        end
      end
    end
  end
end
          
client = Main.new(10110)
client.udp_connect
