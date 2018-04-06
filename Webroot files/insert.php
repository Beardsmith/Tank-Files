<?PHP 
include "../../DBConfigure.php";
include("definitions.php");


$data = $_GET["value"];

if($data > 45000){$data = 45000;}
if($data < 200){$data = 0;}

mysql_select_db(_DATABASE) or die(mysql_error()); 

////////////////////////////////////////////////////////////////////////////
$sql = "INSERT INTO Tank (TankID, Level)VALUES (1,".$data.")";
$retval = mysql_query( $sql, $link );
if(! $retval )
	{die("NO INSERT" . mysql_error());}else{echo "YES INSERT<br>";
	}
$sql = "CALL resetTank()";
$retval = mysql_query( $sql, $link );
if(! $retval )
	{die("NO resetTank()" . mysql_error());}else{echo "YES resetTank()<br>";
	}
mysql_close($link);

?>