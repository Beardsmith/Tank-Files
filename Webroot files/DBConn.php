<?php
// In this page, we open the connection to the Database
function connectToDB( $dbName="Tank" ) {
    // These four parameters must be changed dependent on your MySQL settings
    $hostdb = 'localhost';   // MySQl host
    $userdb = 'root';    // MySQL username
    $passdb = 'yourpasswordhere';    // MySQL password.. Change this to reflect your own password
    $namedb =  $dbName ? $dbName : 'Tank'; // MySQL database name

  	$link =  mysql_connect ($hostdb, $userdb, $passdb);
		
    if (!$link) {
        // we should have connected, but if any of the above parameters
        // are incorrect or we can't access the DB for some reason,
        // then we will stop execution here
        die('Could not connect: ' . mysql_error());
    }

    $db_selected = mysql_select_db($namedb);
    if (!$db_selected) {
        die ('Can\'t use database : ' . mysql_error());
    }
    return $link;
}
?>