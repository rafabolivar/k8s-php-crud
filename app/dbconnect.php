 <?php
    $cons_usuario="nutanix";
    $cons_contra="nutanix/4u";
    $cons_base_datos="mydb1";
    $cons_equipo="10.55.58.59";
    
    $obj_conexion = mysqli_connect($cons_equipo,$cons_usuario,$cons_contra,$cons_base_datos);
    if(!$obj_conexion)
    {
        echo "<h3>No se ha podido conectar PHP - MySQL, verifique sus datos.</h3><hr><br>";
    }
    else
    {
        echo "<h3>Conexion Exitosa PHP - MySQL</h3><hr><br>";
    }

         // ejemplo de una consulta 

    $var_consulta= "select * from ciudadano";
    $var_resultado = $obj_conexion->query($var_consulta);

    if($var_resultado->num_rows>0)
      {
        echo"<table border='1' align='center'>
         <tr bgcolor='#E6E6E6'>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>DNI</th>
            <th>Direccion</th>
        </tr>";
    
    while ($var_fila=$var_resultado->fetch_array())
    {
        echo "<tr>
        <td>".$var_fila["nombre"]."</td>";
        echo "<td>".$var_fila["apellido"]."</td>";
        echo "<td>".$var_fila["dni"]."</td>";
        echo "<td>".$var_fila["direccion"]."</td></tr>";
     }
    }
    else
      {
        echo "No hay Registros";
      }

 
    ?>
