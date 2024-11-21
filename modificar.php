<?php
      if(!empty($_POST["btnActualizar"])){
            if(!empty($_POST["nombre"]) and !empty($_POST["marca"]) and !empty($_POST["precio"])){
                  $id = $_POST["id"];
                  $nombre =$_POST["nombre"];
                  $cantidad =$_POST["cantidad"];
                  $marca =$_POST["marca"];
                  $precio =$_POST["precio"];
                  $sql = $conexion->query("UPDATE productos SET nombreProducto='$nombre',cantidad=$cantidad,
                  marca='$marca',precioUnitario=$precio WHERE idProducto=$id");
                   if($sql ==1){
                        header("location:index.php");
                   }else{
                        echo '<div class="alert alert-danger">Fallo a Actualizar</div>';
                   }
            }else{
                  echo '<div class="alert alert-warning">Falta algun dato</div>';
            }
      }




?>