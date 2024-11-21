<?php
      if(!empty($_POST["btnGuardar"])){
            if(!empty($_POST["nombre"]) and !empty($_POST["cantidad"]) and !empty($_POST["marca"]) and !empty($_POST["precio"])){
                  $nombre =$_POST["nombre"];
                  $cantidad =$_POST["cantidad"];
                  $marca =$_POST["marca"];
                  $precio =$_POST["precio"];
                  $sql = $conexion->query("INSERT INTO `productos`( `nombreProducto`, `cantidad`, `marca`, `precioUnitario`)
                   VALUES ('$nombre','$cantidad','$marca','$precio')");
                   if($sql ==1){
                        echo '<div class="alert alert-success">Producto Registrado</div>';
                   }else{
                        echo '<div class="alert alert-danger">Fallo a Registrar</div>';
                   }
            }else{
                  echo '<div class="alert alert-warning">Falta algun dato</div>';
            }
      }




?>