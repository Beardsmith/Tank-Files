<?php   
	include("class/FusionCharts.php");
	include("../../DBConn.php");
?>
<HTML>
      <HEAD>
			<TITLE> Water Gauge</TITLE>
			<SCRIPT LANGUAGE="Javascript" SRC="fusioncharts/fusioncharts.js"></SCRIPT>
     </HEAD>
     <BODY >
	 <table align="center"><tr align="center"><td align="center">
		<?php             
			$link = connectToDB();
			$strXML = "<chart caption='Main Tank Level In Litres'  majorTMNumber='10' majorTMColor='#000000' majorTMHeight='60' majorTMThickness='2' minorTMNumber='4' lowerlimit='0' upperlimit='45000' lowerlimitdisplay='Empty 0' upperlimitdisplay='45000 Full' valueFontBold='1' valueFontSize='24' outCnvBaseFontSize ='24' showvalue='1' valuebelowpivot='1' theme='fint'> <colorrange> ";
			$strQuery = "select * from gauge_detail";
			$result = mysql_query($strQuery) or die(mysql_error());
			if ($result) {
							while($ors = mysql_fetch_array($result)) {
								   $strQuery = "select min_value,max_value,color_code  from gauge_detail where id=" . $ors['id'];
								   $strXML.="<color minvalue='" . $ors['min_value'] . "'  maxvalue='" . $ors['max_value'] . "'   code='" . $ors['color_code'] . "'  />";
							}
						 }
						   
			$strXML .= "</colorrange> <dials>";
			$strQuery = "select * FROM Tank  WHERE TankID = 1 ORDER BY ID DESC LIMIT 1";
			$result = mysql_query($strQuery) or die(mysql_error());
			if ($result) {
							$ors = mysql_fetch_array($result);
								$strQuery = "select Level from Tank where ID =" . $ors['ID'];
								$strXML .= "<dial value='" . $ors['Level'] . "' bgColor='#000000'  />";
								   
							 
						 }
			mysql_close($link);
			$strXML .= " </dials></chart>";

			echo renderChart("angulargauge", "", $strXML, "FactorySum", 1024, 500, false, false);

          ?>
		 </td></tr></table>
	</BODY>
</HTML>