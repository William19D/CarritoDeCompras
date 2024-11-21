<?php
include "conexion.php";

// Verificamos si se ha pasado el ID como parámetro en la URL
if (!isset($_GET['id']) || empty($_GET['id'])) {
    echo '<div class="alert alert-danger">No se proporcionó un ID válido para modificar.</div>';
    exit;
}

$id = $_GET['id'];

// Consultamos los datos de la preferencia a modificar
$sql = $conexion->prepare("SELECT codigo, nombre, descripcion, cantidad, estado, fecha, oferta, codigoBarras FROM catalogopreferencias WHERE id = ?");
$sql->bind_param("i", $id);
$sql->execute();
$resultado = $sql->get_result();

if ($resultado->num_rows === 0) {
    echo '<div class="alert alert-danger">No se encontró la preferencia con el ID proporcionado.</div>';
    exit;
}

$preferencia = $resultado->fetch_object();

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['btnActualizar'])) {
    // Obtenemos los valores del formulario
    $codigo = $_POST['codigo'];
    $nombre = $_POST['nombre'];
    $descripcion = $_POST['descripcion'];
    $cantidad = $_POST['cantidad'];
    $estado = $_POST['estado'];
    $fecha = $_POST['fecha'];
    $oferta = $_POST['oferta'];
    $codigoBarras = $_POST['codigoBarras'];

    // Actualizamos los datos de la preferencia
    $updateSql = $conexion->prepare(
        "UPDATE catalogopreferencias SET codigo = ?, nombre = ?, descripcion = ?, cantidad = ?, estado = ?, fecha = ?, oferta = ?, codigoBarras = ? WHERE id = ?"
    );
    $updateSql->bind_param("sssissdsi", $codigo, $nombre, $descripcion, $cantidad, $estado, $fecha, $oferta, $codigoBarras, $id);

    if ($updateSql->execute()) {
        echo '<div class="alert alert-success">Preferencia actualizada exitosamente.</div>';
        header("Location: ../catalogoPreferencias.php");
    } else {
        echo '<div class="alert alert-danger">Error al actualizar la preferencia.</div>';
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Actualizar Preferencia</title>
</head>
<body>
<div class="container p-5">
    <h3 class="text-center text-secondary">Actualizar Preferencia</h3>
    <form method="POST">
        <div class="mb-3">
            <label class="form-label">Código:</label>
            <input type="text" class="form-control" name="codigo" value="<?= $preferencia->codigo ?>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Nombre:</label>
            <input type="text" class="form-control" name="nombre" value="<?= $preferencia->nombre ?>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Descripción:</label>
            <textarea class="form-control" name="descripcion" required><?= $preferencia->descripcion ?></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Cantidad:</label>
            <input type="number" class="form-control" name="cantidad" value="<?= $preferencia->cantidad ?>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Estado:</label>
            <input type="text" class="form-control" name="estado" value="<?= $preferencia->estado ?>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Fecha:</label>
            <input type="date" class="form-control" name="fecha" value="<?= $preferencia->fecha ?>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Oferta:</label>
            <input type="text" class="form-control" name="oferta" value="<?= $preferencia->oferta ?>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Código de Barras:</label>
            <input type="text" class="form-control" name="codigoBarras" value="<?= $preferencia->codigoBarras ?>" required>
        </div>
        <button type="submit" class="btn btn-outline-info" name="btnActualizar" value="ok">Actualizar</button>
    </form>
</div>
</body>
</html>
