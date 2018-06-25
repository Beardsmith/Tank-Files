<?PHP

$link = mysql_connect('localhost','root','[your password here');
if (!$link) {
    die('Could not connect: ' . mysql_error());
}
?>