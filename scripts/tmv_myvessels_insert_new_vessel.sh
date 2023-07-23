#/bin!/bash

# Dieses Skript ermöglicht die Eintragung eines neuen Schiffs in die Liste der zu trackenden Schiffe"

clear
echo
echo "EINTRAGEN VON (TEST)SCHIFFEN IN tmv_myvessels_nmea"
echo
read -p "Name: " name
read -p "MMSI: " mmsi
read -p "IMO:  " imo
read -p "Call: " callsign
read -p "Flag (country): " flag
read -p "Flag code: " flag_code
read -p "Company (z.B. Hapag-Lloyd, Maersk, COSCO, One etc.): " company
read -p "Vesseltype (z.B. RO-RO/CONTAINER CARRIER, GENERAL CARGO, CONTAINER SHIP): " vesseltype
read -p "Schiffstyp (AIS-Code, z.B. 70 für Frachtschiff): " aistype
read -p "Length: " length
read -p "Breadth/Width: " breadth
read -p "Year Built: " year 
read -p "Testship ('yes' Schiff soll nicht getrackt werden; 'no' Schiff zum Tracken): " testship
read -p "Status (Active/Changed/Dead): " status


date_of_entry=$(date +%Y-%m-%d)

  #insert="'','$name',NULL,NULL,NULL,NULL,'$company','$vesseltype','$aistype','$mmsi','$imo','$callsign',NULL,'$flag','$flag_code',NULL,NULL,NULL,'$length','$breadth',NULL,NULL,NULL,NULL,'$year',NULL,'$testship','$status','$date_of_entry'"
  insert="'$name','$company','$vesseltype','$aistype','$mmsi','$imo','$callsign','$flag','$flag_code','$length','$breadth','$year','$testship','$status','$date_of_entry'"
  #insert="'$name','$mmsi'"

echo "$insert"
read -p "Stimmen die Daten? Sollen sie jetzt in die Datenbank geschrieben werden? [J|j|Ja|ja] " daten

case "$daten" in
  J|j|Ja|ja)  
    #echo "INSERT INTO tmv_myvessels_nmea VALUES ($insert);"  | mysql -u vesseltracker -p trackmyvessel --verbose
    echo "INSERT INTO tmv_myvessels_nmea (name_myvessels, company_myvessels, vessel_type_myvessels, ship_cargo_type_type5_nmea, mmsi_myvessels, imo_myvessels, callsign_myvessels, flag_myvessels, flag_code_myvessels, length_m_myvessels, breadth_m_myvessels, year_built_myvessels, testship_myvessels, status_myvessels, last_update_myvessels) VALUES ($insert);"  | mysql -u vesseltracker -p trackmyvessel --verbose
    #echo "INSERT INTO tmv_myvessels_nmea (name_myvessels, mmsi_myvessels) VALUES ($insert);"  | mysql -u vesseltracker -p trackmyvessel --verbose
    echo
    echo "TESTAUSGABE"
    echo "SELECT * FROM tmv_myvessels_nmea;"  | mysql -u vesseltracker -p trackmyvessel --verbose
  ;;
  N|n|Nein|nein|*)
    echo "Der Vorgang wird abgebrochen!"
    exit 0
esac