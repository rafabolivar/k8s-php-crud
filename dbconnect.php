<?php

$conn = mysql_connect('dbserver','dbuser','dbpass');
mysql_select_db('dbname',$conn);

if (!mysql_ping ($conn)) {
   //here is the major trick, you have to close the connection (even though its not currently working) for it to recreate properly.
   mysql_close($conn);
   $conn = mysql_connect('dbserver','dbuser','dbpass');
   mysql_select_db('dbname',$conn);
}

$consulta = sprintf("SELECT * FROM db");

// Ejecutar la consulta

$resultado = mysql_query($consulta);

if (!$resultado) {
    $mensaje  = 'Consulta no válida: ' . mysql_error() . "\n";
    $mensaje .= 'Consulta completa: ' . $consulta;
    die($mensaje);
}

mysql_free_result($resultado);

?>
