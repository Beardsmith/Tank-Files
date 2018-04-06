<?PHP

$link = mysql_connect('localhost','root','PUT_YOUR_PASSWORD_HERE');
if (!$link) {
    die('Could not connect: ' . mysql_error());
}
?>