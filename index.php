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
  ?>
  <div class="col-8 p-4">
  <table class="table">
  <thead class="bg-info">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nombre</th>
      <th scope="col">Cantidad</th>
      <th scope="col">Marca</th>
      <th scope="col">Precio</th>
      <th scope="col"></th>

    </tr>
  </thead>
  <tbody>
    <?php
    include "conexion.php";
    $sql = $conexion ->query("SELECT * FROM productos");
    while($datos = $sql-> fetch_object()){?>
  <tr>
      <th scope="row"><?= $datos->idProducto ?></th>
      <td><?= $datos->nombreProducto ?></td>
      <?php
      if($datos->cantidad  == 0){?>
        <td class="table-danger"><?= $datos->cantidad ?></td>
      <?php }else{?>
        <td class="table-success"><?= $datos->cantidad ?></td>
        <?php }?>
    
      <td><?= $datos->marca ?></td>
      <td><?= $datos->precioUnitario ?></td>
      <td>
        <a href="actualizar.php?id=<?= $datos->idProducto ?>" class="btn btn-small btn-warning"><i class="fa-solid fa-pen-to-square"></i></a>
        <a href="eliminar.php?id=<?= $datos->idProducto ?>" class="btn btn-small btn-danger"><i class="fa-solid fa-eraser"></i></a>
      </td>
    </tr>
    <?php }
    ?>
  </tbody>
</table>
  </div>

  </div>

</body>

</html>