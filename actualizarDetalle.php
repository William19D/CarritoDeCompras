<?php
include "conexion.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['btnActualizar'])) {
    // Recoge los valores del formulario
    $id = $_POST['id']; // El ID del detalle producto a actualizar
    $idCarroCompras = $_POST['idCarroCompras'];
    $idProducto = $_POST['idProducto'];
    $estado = $_POST['estado'];
    $cantidad = $_POST['cantidad'];
    $concepto = $_POST['concepto'];
    $monto = $_POST['monto'];
    $impuesto = $_POST['impuesto'];
    $subtotal = $_POST['subtotal'];
    $fechaEntrega = $_POST['fechaEntrega'];
    $fechaPrestamo = $_POST['fechaPrestamo'];

    // Prepara la consulta SQL para actualizar los detalles del producto
    $sql = $conexion->prepare("UPDATE detalleproducto SET idCarroCompras = ?, idProducto = ?, estado = ?, cantidad = ?, concepto = ?, monto = ?, impuesto = ?, subtotal = ?, fechaEntrega = ?, fechaPrestamo = ? WHERE id = ?");
    $sql->bind_param("iisissddssi", $idCarroCompras, $idProducto, $estado, $cantidad, $concepto, $monto, $impuesto, $subtotal, $fechaEntrega, $fechaPrestamo, $id);

    // Ejecuta la consulta y muestra un mensaje de éxito o error
    if ($sql->execute()) {
        echo '<div class="alert alert-success">Detalle actualizado exitosamente.</div>';
        // Opcional: Redirigir a una página de éxito o detalles actualizados
        // header("Location: detalleProducto.php");
    } else {
        echo '<div class="alert alert-danger">Error al actualizar el detalle.</div>';
    }
}

// Recuperar el detalle del producto para mostrarlo en el formulario
$id = $_GET['id'];
$sql = $conexion->query("SELECT id, idCarroCompras, idProducto, estado, cantidad, concepto, monto, impuesto, subtotal, fechaEntrega, fechaPrestamo FROM detalleproducto WHERE id = $id");
$detalle = $sql->fetch_object();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/e3700bf5e9.js" crossorigin="anonymous"></script>
    <title>Actualizar Detalle Producto</title>
</head>
<body>
<?php include "navbar.php"; ?>

<div class="container-fluid row">
    <form class="col-4 p-3" method="POST">
        <fieldset>
            <h3 class="text-center text-secondary">Actualizar Detalle Producto</h3>
            <input type="hidden" name="id" value="<?= $detalle->id ?>">
            <div class="mb-3">
                <label class="form-label">ID Carro Compras:</label>
                <input type="text" class="form-control" name="idCarroCompras" value="<?= $detalle->idCarroCompras ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">ID Producto:</label>
                <input type="text" class="form-control" name="idProducto" value="<?= $detalle->idProducto ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Estado:</label>
                <input type="text" class="form-control" name="estado" value="<?= $detalle->estado ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Cantidad:</label>
                <input type="number" class="form-control" name="cantidad" value="<?= $detalle->cantidad ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Concepto:</label>
                <input type="text" class="form-control" name="concepto" value="<?= $detalle->concepto ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Monto:</label>
                <input type="number" step="0.01" class="form-control" name="monto" value="<?= $detalle->monto ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Impuesto:</label>
                <input type="number" step="0.01" class="form-control" name="impuesto" value="<?= $detalle->impuesto ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Subtotal:</label>
                <input type="number" step="0.01" class="form-control" name="subtotal" value="<?= $detalle->subtotal ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Fecha de Entrega:</label>
                <input type="date" class="form-control" name="fechaEntrega" value="<?= $detalle->fechaEntrega ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Fecha de Préstamo:</label>
                <input type="date" class="form-control" name="fechaPrestamo" value="<?= $detalle->fechaPrestamo ?>" required>
            </div>
            <button type="submit" class="btn btn-outline-info m-auto" name="btnActualizar" value="ok">Actualizar</button>
        </fieldset>
    </form>
</div>
</body>
</html>
