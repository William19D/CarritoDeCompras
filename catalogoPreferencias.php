<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/e3700bf5e9.js" crossorigin="anonymous"></script>
    <title>Catálogo de Preferencias</title>
</head>
<body>
<?php
include "navbar.php";
include "conexion.php";
include "Inventario.php"; // Ensure this file contains the definition of the Inventario class

$inventario = new Inventario($conexion); // Instantiate the Inventario object

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['btnGuardar'])) {
    $codigo = $_POST['codigo'];
    $nombre = $_POST['nombre'];
    $descripcion = $_POST['descripcion'];
    $cantidad = $_POST['cantidad'];
    $estado = $_POST['estado'];
    $fecha = $_POST['fecha'];
    $oferta = $_POST['oferta'];
    $codigoBarras = $_POST['codigoBarras'];
    $idCiudadano = $_POST['idCiudadano'];
    $idProducto = $_POST['idProducto'];

    $sql = $conexion->prepare("INSERT INTO catalogopreferencias (codigo, nombre, descripcion, cantidad, estado, fecha, oferta, codigoBarras, idCiudadano, idProducto) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $sql->bind_param("sssissdsii", $codigo, $nombre, $descripcion, $cantidad, $estado, $fecha, $oferta, $codigoBarras, $idCiudadano, $idProducto);

    if ($sql->execute()) {
        echo '<div class="alert alert-success">Preferencia guardada exitosamente</div>';
    } else {
        echo '<div class="alert alert-danger">Error al guardar la preferencia</div>';
    }
}
?>

<form class="col-4 p-3" method="POST">
    <fieldset>
        <h3 class="text-center text-secondary">Catálogo de Preferencias</h3>
        <div class="mb-3">
            <label class="form-label">Producto:</label>
            <?php $inventario->generarListaDesplegableIdProducto(); ?>
        </div>
        <div class="mb-3">
            <label class="form-label">Ciudadano:</label>
            <?php $inventario->generarListaDesplegableIdCiudadano(); ?>
        </div>
        <div class="mb-3">
            <label class="form-label">Código:</label>
            <input type="text" class="form-control" placeholder="Código de la Preferencia" name="codigo">
        </div>
        <div class="mb-3">
            <label class="form-label">Nombre:</label>
            <input type="text" class="form-control" placeholder="Nombre de la Preferencia" name="nombre">
        </div>
        <div class="mb-3">
            <label class="form-label">Descripción:</label>
            <textarea class="form-control" placeholder="Descripción de la Preferencia" name="descripcion"></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Cantidad:</label>
            <input type="number" class="form-control" placeholder="Cantidad" name="cantidad">
        </div>
        <div class="mb-3">
            <label class="form-label">Estado:</label>
            <input type="text" class="form-control" placeholder="Estado" name="estado">
        </div>
        <div class="mb-3">
            <label class="form-label">Fecha:</label>
            <input type="date" class="form-control" name="fecha">
        </div>
        <div class="mb-3">
            <label class="form-label">Oferta:</label>
            <input type="text" class="form-control" placeholder="Oferta" name="oferta">
        </div>
        <div class="mb-3">
            <label class="form-label">Código de Barras:</label>
            <input type="text" class="form-control" placeholder="Código de Barras" name="codigoBarras">
        </div>
        <button type="submit" class="btn btn-outline-info m-auto" name="btnGuardar" value="ok">Guardar</button>
    </fieldset>
</form>

<?php
$sql = $conexion->query("SELECT id, codigo, nombre, descripcion, cantidad, estado, fecha, oferta, codigoBarras, idProducto, idCiudadano FROM catalogopreferencias");
?>

<table class="table">
    <thead class="bg-info">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Código</th>
        <th scope="col">Nombre</th>
        <th scope="col">Descripción</th>
        <th scope="col">Cantidad</th>
        <th scope="col">Estado</th>
        <th scope="col">Fecha</th>
        <th scope="col">Oferta</th>
        <th scope="col">Código de Barras</th>
        <th scope="col">Id Producto</th>
        <th scope="col">Id Ciudadano</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <?php while($datos = $sql->fetch_object()){ ?>
        <tr>
            <th scope="row"><?= $datos->id ?></th>
            <td><?= $datos->codigo ?></td>
            <td><?= $datos->nombre ?></td>
            <td><?= $datos->descripcion ?></td>
            <td><?= $datos->cantidad ?></td>
            <td><?= $datos->estado ?></td>
            <td><?= $datos->fecha ?></td>
            <td><?= $datos->oferta ?></td>
            <td><?= $datos->codigoBarras ?></td>
            <td><?= $datos->idProducto ?></td>
            <td><?= $datos->idCiudadano ?></td>
            <td>
                <a href="actualizarCatalogo.php?id=<?= $datos->id ?>" class="btn btn-small btn-warning"><i class="fa-solid fa-pen-to-square"></i></a>
                <a href="eliminar/eliminarCatalogo.php?id=<?= $datos->id ?>" class="btn btn-small btn-danger"><i class="fa-solid fa-eraser"></i></a>
            </td>
        </tr>
    <?php } ?>
    </tbody>
</table>
</div>
</body>
</html>