<?php
      include "../conexion.php";
      if(!empty($_GET["id"])){
            $id = $_GET["id"];
            $sql= $conexion->query("DELETE FROM carrocompras WHERE id=$id");
            if($sql ==1){
                  header("localhost/CarritoDeCompras/index.php");
            }else{
                  echo '<div class="alert alert-success">Problemas a la hora de eliminar</div>';
            }
      }
?>