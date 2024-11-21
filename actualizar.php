<?php
include "conexion.php";
$id = $_GET["id"];
$sql = $conexion->query("SELECT * FROM productos WHERE idProducto=$id")
?>
<!DOCTYPE html>
<html lang="es">

<head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
      <script src="https://kit.fontawesome.com/e3700bf5e9.js" crossorigin="anonymous"></script>
      <title>Actualizar</title>
</head>

<body>
      <?php
      include "navbar.php";
      ?>
      <div class="container-fluid row">
            <form class="col-4 p-3 m-auto" method="POST">
                  <fieldset>
                        <h3 class="text-center  text-secondary">Actualizar Productos</h3>
                        <input type="hidden" name="id" value="<?=  $_GET["id"] ?>">
                        <?php
                        include "modificar.php";
                        while ($datos = $sql->fetch_object()) { ?>
                              <div class="mb-3">
                                    <label class="form-label">Nombre:</label>
                                    <input type="text" class="form-control" placeholder="Nombre del Producto" name="nombre" value="<?= $datos->nombreProducto ?>">
                              </div>
                              <div class="mb-3">
                                    <label class="form-label">Cantidad:</label>
                                    <input type="text" class="form-control" placeholder="Cantidad" name="cantidad" value="<?= $datos->cantidad ?>">
                              </div>
                              <div class="mb-3">
                                    <label class="form-label">Marca:</label>
                                    <input type="text" class="form-control" placeholder="Marca" name="marca" value="<?= $datos->marca ?>">
                              </div>
                              <div class="mb-3">
                                    <label class="form-label">Precio:</label>
                                    <input type="text" class="form-control" placeholder="Precio Unitario" name="precio" value="<?= $datos->precioUnitario ?>">
                              </div>
                              <div class="mb-3">
                              </div>
                        <?php
                        } ?>

                        <button type="submit" class="btn btn-outline-info" name="btnActualizar" value="ok">Actualizar Producto</button>
                  </fieldset>
            </form>
</body>

</html>