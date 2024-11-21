<?php
global $conexion;
include "../Inventario.php";
include "../conexion.php";

$inventario = new Inventario($conexion);

// Verificamos si se ha pasado el ID como parámetro en la URL
if (isset($_GET["id"])) {
    $id = $_GET["id"];

    // Consultamos el carro de compras a modificar
    $sql = $conexion->query("SELECT * FROM carrocompras WHERE id = $id");

    // Verificar si se encontraron resultados
    if ($sql->num_rows > 0) {
        $datos = $sql->fetch_object();
    } else {
        echo "<div class='alert alert-danger'>Carro de compras no encontrado.</div>";
        exit();
    }
} else {
    echo "<div class='alert alert-danger'>ID no proporcionado.</div>";
    exit();
}

// Verificamos si se ha enviado el formulario para actualizar los datos
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['btnActualizar'])) {
    // Obtener los datos del formulario
    $idCiudadano = $_POST['idCiudadano'];
    $codigo = $_POST['codigo'];
    $fecha = $_POST['fecha'];
    $hora = $_POST['hora'];
    $estado = $_POST['estado'];
    $observaciones = $_POST['observaciones'];
    $descripcion = $_POST['descripcion'];
    $detalle = $_POST['detalle'];
    $concepto = $_POST['concepto'];
    $impuesto = $_POST['impuesto'];
    $subtotal = $_POST['subtotal'];
    $total = $_POST['total'];

    // Actualizamos el carro de compras en la base de datos
    $updateSQL = $conexion->prepare("UPDATE carrocompras SET idCiudadano = ?, codigo = ?, fecha = ?, hora = ?, estado = ?, observaciones = ?, descripcion = ?, detalle = ?, concepto = ?, impuesto = ?, subtotal = ?, total = ? WHERE id = ?");
    $updateSQL->bind_param("issssssssdddi", $idCiudadano, $codigo, $fecha, $hora, $estado, $observaciones, $descripcion, $detalle, $concepto, $impuesto, $subtotal, $total, $id);

    // Ejecutar la consulta
    if ($updateSQL->execute()) {
        echo '<div class="alert alert-success">Carro de compras actualizado exitosamente</div>';
        header("Location: ../carroCompras.php");  // Redirige a la lista de carros de compras después de la actualización
    } else {
        echo '<div class="alert alert-danger">Error al actualizar el carro de compras: ' . $conexion->error . '</div>';
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
    <title>Actualizar Carro de Compras</title>
</head>
<body>
<?php include "../navbar.php"; ?>

<div class="container-fluid row">
    <form class="col-4 p-3 m-auto" method="POST">
        <fieldset>
            <h3 class="text-center text-secondary">Actualizar Carro de Compras</h3>
            <div class="mb-3">
                <label class="form-label">ID Ciudadano:</label>
                <?php
                $inventario->generarListaDesplegableIdCiudadano();
                ?>
            </div>
            <div class="mb-3">
                <label class="form-label">Código:</label>
                <input type="text" class="form-control" name="codigo" value="<?= $datos->codigo ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Fecha:</label>
                <input type="date" class="form-control" name="fecha" value="<?= $datos->fecha ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Hora:</label>
                <input type="time" class="form-control" name="hora" value="<?= $datos->hora ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Estado:</label>
                <input type="text" class="form-control" name="estado" value="<?= $datos->estado ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Observaciones:</label>
                <textarea class="form-control" name="observaciones" required><?= $datos->observaciones ?></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Descripción:</label>
                <textarea class="form-control" name="descripcion" required><?= $datos->descripcion ?></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Detalle:</label>
                <textarea class="form-control" name="detalle" required><?= $datos->detalle ?></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Concepto:</label>
                <textarea class="form-control" name="concepto" required><?= $datos->concepto ?></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Impuesto:</label>
                <input type="number" step="0.01" class="form-control" name="impuesto" value="<?= $datos->impuesto ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Subtotal:</label>
                <input type="number" step="0.01" class="form-control" name="subtotal" value="<?= $datos->subtotal ?>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Total:</label>
                <input type="number" step="0.01" class="form-control" name="total" value="<?= $datos->total ?>" required>
            </div>
            <button type="submit" class="btn btn-outline-info m-auto" name="btnActualizar" value="ok">Actualizar</button>
        </fieldset>
    </form>
</div>
</body>
</html>