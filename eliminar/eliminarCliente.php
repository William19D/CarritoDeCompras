<?php
      include "../conexion.php";
      if(!empty($_GET["id"])){
            $id = $_GET["id"];
            $sql= $conexion->query("DELETE FROM ciudadano WHERE cedula=$id");
            if($sql ==1){
                  header("location:/index.php");
            }else{
                  echo '<div class="alert alert-success">Problemas a la hora de eliminar</div>';
            }
      }
?>