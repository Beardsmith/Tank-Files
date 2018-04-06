<?PHP

//SENSORS
$number_Of_Sensors = 3; // 

//CAUTION If I add/delete sensors I need to change the number of sensors here and rewrite the Arduino sketch
// with the appropriate sensor ID's and the call to the php page insert.php
// to reflect the increase in sensor readings sent to the mysql server.


//READINGS & ROWS
$number_Of_Readings = 30; 
$buffer = 2*$number_Of_Sensors; // A buffer to ensure we have a few more rows in the table than needed
$max_Rows_In_Table = ($number_Of_Sensors * $number_Of_Readings) + $buffer; // Maximum rows kept at any time (156 currently)

// Current date and time
date_default_timezone_set('Australia/Brisbane');
$date = date("d M Y h:i:s a");

// DATABASE
define("_DATABASE","Tank");


//HEADINGS AND TITLES
define("PAGE_TITLE","Water Tank Levels ");
define("GAUGE_TITLE","Water Tank Gauge ");
define("GRAPH_TITLE","Water Level Graph ");
define("TITLE_TEXT1","Water Tank levels every 4 hours over last ");
define("TITLE_TEXT2"," days");
define("SUB_TITLE_TEXT","$date");
define("Y_AXIS_TITLE_TEXT","Litres)");
define("TOOLTIP"," Litres");


//SERIES NAMES. Change names to reflect the kind of brew in each fridge
$tank1 = "45000 Litre";
$tank2 = "B&G";
$tank3 = "Ben & Shannon";
define("SERIES_1_NAME","Tank 1");
define("SERIES_2_NAME","Tank 2");
define("SERIES_3_NAME","Tank 3");
define("ROW_LIMIT","$max_Rows_In_Table");
?>
