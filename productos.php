<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://kit.fontawesome.com/e3700bf5e9.js" crossorigin="anonymous"></script>
  <title>Productos</title>
</head>
<body>
<?php
  include "navbar.php";
  ?>
  <div class="container-fluid row">
<?php
global $conexion;
include "conexion.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['btnGuardar'])) {
    $codigo = $_POST['codigo'];
    $nombre = $_POST['nombre'];
    $categoriaPrincipal = $_POST['categoriaPrincipal'];
    $categoriaSecundaria = $_POST['categoriaSecundaria'];
    $descripcion = $_POST['descripcion'];
    $precio = $_POST['precio'];
    $stock = $_POST['stock'];
    $detalle = $_POST['detalle'];
    $caracteristicas = $_POST['caracteristicas'];
    $garantia = $_POST['garantia'];
    $estado = $_POST['estado'];

    $sql = $conexion->prepare("INSERT INTO producto (codigo, nombre, categoriaPrincipal, categoriaSecundaria, descripcion, precio, stock, detalle, caracteristicas, garantia, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $sql->bind_param("sssssdissss", $codigo, $nombre, $categoriaPrincipal, $categoriaSecundaria, $descripcion, $precio, $stock, $detalle, $caracteristicas, $garantia, $estado);

    if ($sql->execute()) {
        echo '<div class="alert alert-success">Producto guardado exitosamente</div>';
    } else {
        echo '<div class="alert alert-danger">Error al guardar el producto</div>';
    }
}
?>

<form class="col-4 p-3" method="POST">
    <fieldset>
        <h3 class="text-center text-secondary">Productos</h3>
        <div class="mb-3">
            <label class="form-label">Código:</label>
            <input type="text" class="form-control" placeholder="Código del Producto" name="codigo">
        </div>
        <div class="mb-3">
            <label class="form-label">Nombre:</label>
            <input type="text" class="form-control" placeholder="Nombre del Producto" name="nombre">
        </div>
        <div class="mb-3">
            <label class="form-label">Categoría Principal:</label>
            <input type="text" class="form-control" placeholder="Categoría Principal" name="categoriaPrincipal">
        </div>
        <div class="mb-3">
            <label class="form-label">Categoría Secundaria:</label>
            <input type="text" class="form-control" placeholder="Categoría Secundaria" name="categoriaSecundaria">
        </div>
        <div class="mb-3">
            <label class="form-label">Descripción:</label>
            <textarea class="form-control" placeholder="Descripción del Producto" name="descripcion"></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Precio:</label>
            <input type="text" class="form-control" placeholder="Precio Unitario" name="precio">
        </div>
        <div class="mb-3">
            <label class="form-label">Stock:</label>
            <input type="text" class="form-control" placeholder="Stock" name="stock">
        </div>
        <div class="mb-3">
            <label class="form-label">Detalle:</label>
            <textarea class="form-control" placeholder="Detalle del Producto" name="detalle"></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Características:</label>
            <textarea class="form-control" placeholder="Características del Producto" name="caracteristicas"></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Garantía:</label>
            <input type="text" class="form-control" placeholder="Garantía" name="garantia">
        </div>
        <div class="mb-3">
            <label class="form-label">Estado:</label>
            <input type="text" class="form-control" placeholder="Estado" name="estado">
        </div>
        <button type="submit" class="btn btn-outline-info m-auto" name="btnGuardar" value="ok">Guardar</button>
    </fieldset>
</form>

<?php
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
                <a href="actualizarProducto.php?id=<?= $datos->id ?>" class="btn btn-small btn-warning"><i class="fa-solid fa-pen-to-square"></i></a>
                <a href="eliminar.php?id=<?= $datos->id ?>" class="btn btn-small btn-danger"><i class="fa-solid fa-eraser"></i></a>
            </td>
        </tr>
    <?php } ?>
    </tbody>
</table>