<?PHP 

include("../../DBConfigure.php"); // user, password and other stuff 
include("definitions.php");

////////////////////////////////////////////////////////////////////////////////////
// Open Database Connection
$selected = mysql_select_db("Tank",$link)
  or die("Could not select Tank database");

////////////////////////////////////////////////////////////////////////////////////
//Set limit of number of Levels/hours to display here

// SELECT following values IF 1 hour readings
//$limit = 13;
//$xLegend = 12; 
//
//

// We are showing 60 x 4 hour readings
$hours = 4; // Readings occur every 4 hours
$days = 15; // How many days readings to display


$xLegend = $hours * $days; //60 numerical labels for the x legend
$limit = 61; //we select 61 readings plus one more for Now 
//
//

////////////////////////////////////////////////////////////////////////////////////
// Create array of tank names1
$sql = "SELECT Name FROM Name";
$result = mysql_query($sql);
{
   while($row = mysql_fetch_row($result))
   {
      //adding data to the array
      $name[] = $row[0];
   }
}

////////////////////////////////////////////////////////////////////////////////////
// Create array of readings for Tank 1
$sql = "SELECT ID, Level FROM Tank  WHERE TankID = 1 ORDER BY ID DESC LIMIT $limit";


$result = mysql_query($sql);
{
   while($row = mysql_fetch_row($result))
   {
      //adding data to the array
      $Tank1[] = $row[1];
   }
}

$temp1 = array_reverse($Tank1);

////////////////////////////////////////////////////////////////////////////////////
// Create array of readings for Tank 2
$sql = "SELECT ID, Level FROM Tank WHERE TankID = 2 ORDER BY ID DESC LIMIT $limit";

		/////////////GET DATA FROM Tank 2 INTO ARRAY
$result = mysql_query($sql);
{
   while($row = mysql_fetch_row($result))
   {
      //adding data to the array
      $Tank2[] = $row[1];
   }
}
$temp2 = array_reverse($Tank2);

////////////////////////////////////////////////////////////////////////////////////
// Create array of readings for Tank 3
$sql = "SELECT ID, Level FROM Tank WHERE TankID = 3 ORDER BY ID DESC LIMIT $limit";

		/////////////GET DATA FROM Tank 3 INTO ARRAY
$result = mysql_query($sql);
{
   while($row = mysql_fetch_row($result))
   {
      //adding data to the array
      $Tank3[] = $row[1];
   }
}
$temp3 = array_reverse($Tank3);

////////////////////////////////////////////////////////////////////////////////////
//BEGIN HTML CODE
echo "<!DOCTYPE HTML>
<html>
	<head>
	<meta http-equiv='refresh' content='1800'>
		<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
		<title>".GRAPH_TITLE."</title>

		<script type='text/javascript' src='js/jquery.min.js'></script>
		<script type='text/javascript'>
$(function () {
        $('#container').highcharts({
            title: {
                text: '".TITLE_TEXT1.$days. TITLE_TEXT2."',
                x: -20 //center
            },
            subtitle: {
                text: '".SUB_TITLE_TEXT."',
                x: -20
            },
            xAxis: {
                categories:";


					for ($x=$xLegend; $x>0;$x--)
					$output9[]= $x;
				$output9[]= "Now";
				print  (json_encode($output9, JSON_NUMERIC_CHECK));
			echo "      },
            yAxis: {
                title: {
                    text: '".Y_AXIS_TITLE_TEXT."'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: '".TOOLTIP."'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
		



			<!-- BEGIN series -->
            series: [
						{
						name: '".$name[0]."',
						data:";
						// Write data in JSON array format
						foreach ($temp1 as &$value) {
							$output1[]= $value;
						}
						print  (json_encode($output1, JSON_NUMERIC_CHECK));

					echo"},{
						name: '".$name[1]."',
						data:"; 
						foreach ($temp2 as &$value) {
							$output2[]= $value;
						}
						print  (json_encode($output2, JSON_NUMERIC_CHECK));		
						
					echo"},{
						name: '".$name[2]."',
						data:";
						foreach ($temp3 as &$value) {
							$output3[]= $value;
						}
						print  (json_encode($output3, JSON_NUMERIC_CHECK));

					echo"}
			] <!-- END series -->
        });<!-- END Container -->
    });<!-- END Function -->
    

		</script>
	</head>
	<body bgcolor='#D9D3D2'>
<script src='js/highcharts.js'></script>
<script src='js/modules/exporting.js'></script>

<div id='container' style='min-width: 310px; height: 400px; margin: 0 auto'></div>
	</body>

</html> ";
?>