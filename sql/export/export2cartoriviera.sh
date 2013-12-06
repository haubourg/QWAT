
export db_address=172.24.171.203
export sqliteoutput=/home/denis/Documents/cartoriviera/sige_distribution.sqlite
#export PGCLIENTENCODING=LATIN1;

rm $sqliteoutput

########################################################################
# NODES
read -p "Generate nodes ID for schema? (y/n) " answ
if [ $answ = "y" ] 
then
  # save schema in a table
  psql -h $db_address -U sige -c "DROP TABLE IF EXISTS distribution.vw_pipe_schema_temp;"
  psql -h $db_address -U sige -c "CREATE TABLE distribution.vw_pipe_schema_temp AS SELECT * FROM distribution.vw_pipe_schema_node;"
  read -p "Press any key to continue..."
fi

########################################################################
# TABLES AND VIEWS

echo "search view"
ogr2ogr -sql "SELECT * FROM distribution.vw_search_view"  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln search_view -nlt POINT -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

echo "pipes"
ogr2ogr -sql "SELECT * FROM distribution.vw_pipe WHERE id_distributor = 1"  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln pipe -nlt LINESTRING -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

echo "pipe schema"
ogr2ogr -sql "SELECT * FROM distribution.vw_pipe_schema WHERE id_distributor = 1"  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln pipe_schema -nlt LINESTRING -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

echo "nodes"
ogr2ogr -sql "SELECT * FROM distribution.od_node WHERE _status_active IS TRUE AND _type != 'one' "  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln node -nlt POINT -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

echo "valves"
ogr2ogr -sql "SELECT * FROM distribution.vw_valve "  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln valve -nlt POINT -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

echo "valves schema"
ogr2ogr -sql "SELECT * FROM distribution.od_valve_schema "  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln valve_schema -nlt POINT -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

echo "hydrants"
ogr2ogr -sql "SELECT * FROM distribution.vw_hydrant WHERE id_distributor = 1"  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln hydrant -nlt POINT -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

echo "wateringoutput"
ogr2ogr -sql "SELECT * FROM distribution.od_wateringoutput;"  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln wateringoutput -nlt POINT -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

echo "pressure zones"
ogr2ogr -sql "SELECT * FROM distribution.od_pressurezone" \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln pressurezone -nlt POLYGON -progress \
PG:"dbname='sige' host='172.24.171.203' port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

echo "print maps"
ogr2ogr -sql "SELECT * FROM distribution.od_printmap" \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln printmap -nlt MULTIPOLYGON -progress \
PG:"dbname='sige' host='172.24.171.203' port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

echo "meter"
ogr2ogr -sql "SELECT * FROM distribution.od_meter;"  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln meter -nlt POINT -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

echo "subscriber"
ogr2ogr -sql "SELECT vw_subscriber.*, '<a href=javascript:app.openInfoWindow(\"http://www.cartoriviera.ch/sige/www/gallery.php?type=abonne&abonne='
||identification||'&commune='||od_district.prefix||
'\",\"Abonne\",600,600)>croquis</a>' as links 
FROM distribution.vw_subscriber
LEFT OUTER JOIN distribution.od_district ON vw_subscriber.id_district = od_district.id;"  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln subscriber -nlt POINT -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

echo "protections zone"
ogr2ogr -sql "SELECT * FROM distribution.od_protectionzone"  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln protectionzone -nlt MULTIPOLYGON -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

echo "leaks"
ogr2ogr -sql "SELECT * FROM distribution.vw_leak"  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln leak -nlt POINT -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536

echo "dimensions"
ogr2ogr -sql "SELECT * FROM distribution.od_dimension_distance"  \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln dimension -nlt LINESTRING -progress -preserve_fid \
PG:"dbname='sige' host=$db_address port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536




echo "installation tank"
ogr2ogr -sql "SELECT * FROM distribution.vw_installation_tank_fr WHERE active IS TRUE" \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln installation_tank -nlt POINT -progress \
PG:"dbname='sige' host='172.24.171.203' port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
echo "installation pump"
ogr2ogr -sql "SELECT * FROM distribution.vw_installation_pump_fr WHERE active IS TRUE" \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln installation_pump -nlt POINT -progress \
PG:"dbname='sige' host='172.24.171.203' port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
echo "installation source"
ogr2ogr -sql "SELECT * FROM distribution.vw_installation_source_fr WHERE active IS TRUE" \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln installation_source -nlt POINT -progress \
PG:"dbname='sige' host='172.24.171.203' port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
echo "installation treatment"
ogr2ogr -sql "SELECT * FROM distribution.vw_installation_treatment_fr WHERE active IS TRUE" \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln installation_treatment -nlt POINT -progress \
PG:"dbname='sige' host='172.24.171.203' port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
echo "installation pressurecontrol"
ogr2ogr -sql "SELECT * FROM distribution.vw_installation_pressurecontrol_fr WHERE active IS TRUE" \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln installation_pressurecontrol -nlt POINT -progress \
PG:"dbname='sige' host='172.24.171.203' port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536
echo "installation valvechamber"
ogr2ogr -sql "SELECT * FROM distribution.vw_installation_valvechamber_fr WHERE active IS TRUE" \
-overwrite -a_srs EPSG:21781 -f SQLite $sqliteoutput \
-nln installation_valvechamber -nlt POINT -progress \
PG:"dbname='sige' host='172.24.171.203' port='5432' user='sige' password='db4wat$'" \
-dsco SPATIALITE=no -lco "SPATIAL_INDEX=no FORMAT=SPATIALITE" -gt 65536





########################################################################
# FTP TRANSFER 
read -p "FTP transfer? (y/n) " answ
if [ $answ = "y" ] 
then
	read -p "FTP password? " ftppwd
	ftp -n -v ftp.vevey.ch <<-EOF
	user carto_sige $ftppwd 
	prompt
	binary
	cd Distribution
	put $sqliteoutput sige_distribution_v2.sqlite
	bye
	EOF
fi
