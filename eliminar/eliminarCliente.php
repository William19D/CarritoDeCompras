<?php
      include "../conexion.php";
      if(!empty($_GET["id"])){
            $id = $_GET["id"];
            $sql= $conexion->query("DELETE FROM ciudadano WHERE id=$id");
            if($sql ==1){
                  header("location: ../ciudadano.php");
            }else{
                  echo '<div class="alert alert-success">Problemas a la hora de eliminar</div>';
            }
      }
?>