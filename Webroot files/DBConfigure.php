<?PHP

$link = mysql_connect('localhost','root','redoctober9');
if (!$link) {
    die('Could not connect: ' . mysql_error());
}
?>