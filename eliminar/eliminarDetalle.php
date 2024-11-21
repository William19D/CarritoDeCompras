<?php
      include "../conexion.php";
      if(!empty($_GET["idCarroCompras"])){
            $id = $_GET["idCarroCompras"];
            $sql= $conexion->query("DELETE FROM carrocompras WHERE id=$id");
            if($sql ==1){
                  header("Location: ../detalleproducto.php");
            }else{
                  echo '<div class="alert alert-success">Problemas a la hora de eliminar</div>';
            }
      }
?>