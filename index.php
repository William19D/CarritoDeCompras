<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://kit.fontawesome.com/e3700bf5e9.js" crossorigin="anonymous"></script>
  <title>Inicio</title>
</head>
<body>
 
<?php
include "navbar.php";
include "conexion.php";
$sql = $conexion->query("SELECT id, codigo, nombre, categoriaPrincipal, categoriaSecundaria, descripcion, precio, stock, detalle, caracteristicas, garantia, estado FROM producto");
?>

<table class="table">
    <thead class="bg-info">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Código</th>
        <th scope="col">Nombre</th>
        <th scope="col">Categoría Principal</th>
        <th scope="col">Categoría Secundaria</th>
        <th scope="col">Descripción</th>
        <th scope="col">Precio</th>
        <th scope="col">Stock</th>
        <th scope="col">Detalle</th>
        <th scope="col">Características</th>
        <th scope="col">Garantía</th>
        <th scope="col">Estado</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <?php while($datos = $sql->fetch_object()){ ?>
        <tr>
            <th scope="row"><?= $datos->id ?></th>
            <td><?= $datos->codigo ?></td>
            <td><?= $datos->nombre ?></td>
            <td><?= $datos->categoriaPrincipal ?></td>
            <td><?= $datos->categoriaSecundaria ?></td>
            <td><?= $datos->descripcion ?></td>
            <td><?= $datos->precio ?></td>
            <?php
        if($datos->stock  == 0){?>
            <td class="table-danger"><?= $datos->stock ?></td>
        <?php }else{?>
            <td class="table-success"><?= $datos->stock ?></td>
            <?php }?>
            <td><?= $datos->detalle ?></td>
            <td><?= $datos->caracteristicas ?></td>
            <td><?= $datos->garantia ?></td>
            <td><?= $datos->estado ?></td>
            <td>
                <a href="actualizar.php?id=<?= $datos->id ?>" class="btn btn-small btn-warning"><i class="fa-solid fa-pen-to-square"></i></a>
                <a href="eliminar.php?id=<?= $datos->id ?>" class="btn btn-small btn-danger"><i class="fa-solid fa-eraser"></i></a>
            </td>
        </tr>
    <?php } ?>
  </tbody>
</table>
  </div>

  </div>

</body>

</html>