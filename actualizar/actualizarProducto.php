<?php

include "../conexion.php";

// Verificamos si se ha pasado el ID como parámetro en la URL
if (isset($_GET["id"])) {
    $id = $_GET["id"];

    // Consultamos el producto a modificar
    $sql = $conexion->query("SELECT * FROM producto WHERE id = $id");

    // Verificar si se encontraron resultados
    if ($sql->num_rows > 0) {
        $datos = $sql->fetch_object();
    } else {
        echo "<div class='alert alert-danger'>Producto no encontrado.</div>";
        exit();
    }
} else {
    echo "<div class='alert alert-danger'>ID no proporcionado.</div>";
    exit();
}

// Verificamos si se ha enviado el formulario para actualizar los datos
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['btnActualizar'])) {
    // Obtener los datos del formulario
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

    // Actualizamos el producto en la base de datos
    $updateSQL = $conexion->prepare("UPDATE producto SET codigo = ?, nombre = ?, categoriaPrincipal = ?, categoriaSecundaria = ?, descripcion = ?, precio = ?, stock = ?, detalle = ?, caracteristicas = ?, garantia = ?, estado = ? WHERE id = ?");
    $updateSQL->bind_param("sssssdissssi", $codigo, $nombre, $categoriaPrincipal, $categoriaSecundaria, $descripcion, $precio, $stock, $detalle, $caracteristicas, $garantia, $estado, $id);

    // Ejecutar la consulta
    if ($updateSQL->execute()) {
        echo '<div class="alert alert-success">Producto actualizado exitosamente</div>';
        header("Location: ../index.php");  // Redirige a la lista de productos después de la actualización
    } else {
        echo '<div class="alert alert-danger">Error al actualizar el producto: ' . $conexion->error . '</div>';
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/e3700bf5e9.js" crossorigin="anonymous"></script>
    <title>Actualizar Producto</title>
</head>
<body>
<?php include "../navbar.php"; ?>

<div class="container-fluid row">
    <form class="col-4 p-3 m-auto" method="POST">
        <fieldset>
            <h3 class="text-center text-secondary">Actualizar Producto</h3>
            <div class="mb-3">
                <label class="form-label">Código:</label>
                <input type="text" class="form-control" name="codigo" value="<?= $datos->codigo ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Nombre:</label>
                <input type="text" class="form-control" name="nombre" value="<?= $datos->nombre ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Categoría Principal:</label>
                <input type="text" class="form-control" name="categoriaPrincipal" value="<?= $datos->categoriaPrincipal ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Categoría Secundaria:</label>
                <input type="text" class="form-control" name="categoriaSecundaria" value="<?= $datos->categoriaSecundaria ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Descripción:</label>
                <textarea class="form-control" name="descripcion" required><?= $datos->descripcion ?></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Precio:</label>
                <input type="text" class="form-control" name="precio" value="<?= $datos->precio ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Stock:</label>
                <input type="text" class="form-control" name="stock" value="<?= $datos->stock ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Detalle:</label>
                <textarea class="form-control" name="detalle" required><?= $datos->detalle ?></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Características:</label>
                <textarea class="form-control" name="caracteristicas" required><?= $datos->caracteristicas ?></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Garantía:</label>
                <input type="text" class="form-control" name="garantia" value="<?= $datos->garantia ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Estado:</label>
                <input type="text" class="form-control" name="estado" value="<?= $datos->estado ?>" required>
            </div>
            <button type="submit" class="btn btn-outline-info m-auto" name="btnActualizar" value="ok">Actualizar</button>
        </fieldset>
    </form>
</div>
</body>
</html>
