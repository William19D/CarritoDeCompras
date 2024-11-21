<?php
      include "../conexion.php";
      if(!empty($_GET["id"])){
            $id = $_GET["id"];
            $sql= $conexion->query("DELETE FROM catalogopreferencias WHERE id=$id");
            if($sql ==1){
                  header("Location: ../catalogoPreferencias.php");
            }else{
                  echo '<div class="alert alert-success">Problemas a la hora de eliminar</div>';
            }
      }
?>