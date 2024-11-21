<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/e3700bf5e9.js" crossorigin="anonymous"></script>
    <title>Carro de Compras</title>
</head>
<body>
<?php
include "navbar.php";
include "conexion.php";
include "Inventario.php";

$productos = new Inventario($conexion);

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['btnGuardar'])) {
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

    $sql = $conexion->prepare("INSERT INTO carroCompras (codigo, fecha, hora, estado, observaciones, descripcion, detalle, concepto, impuesto, subtotal, total) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $sql->bind_param("ssssssssddd", $codigo, $fecha, $hora, $estado, $observaciones, $descripcion, $detalle, $concepto, $impuesto, $subtotal, $total);

    if ($sql->execute()) {
        echo '<div class="alert alert-success">Carro de compras guardado exitosamente</div>';
    } else {
        echo '<div class="alert alert-danger">Error al guardar el carro de compras</div>';
    }
}
?>
<div class="container-fluid row">
    <?php
    global $conexion;
    include "conexion.php";

    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['btnGuardar'])) {
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

        $sql = $conexion->prepare("INSERT INTO carroCompras (codigo, fecha, hora, estado, observaciones, descripcion, detalle, concepto, impuesto, subtotal, total) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $sql->bind_param("ssssssssddd", $codigo, $fecha, $hora, $estado, $observaciones, $descripcion, $detalle, $concepto, $impuesto, $subtotal, $total);

        if ($sql->execute()) {
            echo '<div class="alert alert-success">Carro de compras guardado exitosamente</div>';
        } else {
            echo '<div class="alert alert-danger">Error al guardar el carro de compras</div>';
        }
    }
    ?>

    <form class="col-4 p-3" method="POST">
        <fieldset>
            <h3 class="text-center text-secondary">Carro de Compras</h3>
            <div class="mb-3">
                <label class="form-label">Código:</label>
                <input type="text" class="form-control" placeholder="Código del Carro" name="codigo">
            </div>
            <div class="mb-3">
                <label class="form-label">Fecha:</label>
                <input type="date" class="form-control" name="fecha">
            </div>
            <div class="mb-3">
                <label class="form-label">Hora:</label>
                <input type="time" class="form-control" name="hora">
            </div>
            <div class="mb-3">
                <label class="form-label">Estado:</label>
                <input type="text" class="form-control" placeholder="Estado" name="estado">
            </div>
            <div class="mb-3">
                <label class="form-label">Observaciones:</label>
                <textarea class="form-control" placeholder="Observaciones" name="observaciones"></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Descripción:</label>
                <textarea class="form-control" placeholder="Descripción" name="descripcion"></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Detalle:</label>
                <?php $productos->generarListaDesplegable(); ?>
            </div>
            <div class="mb-3">
                <label class="form-label">Concepto:</label>
                <textarea class="form-control" placeholder="Concepto" name="concepto"></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Impuesto:</label>
                <input type="number" step="0.01" class="form-control" placeholder="Impuesto" name="impuesto">
            </div>
            <div class="mb-3">
                <label class="form-label">Subtotal:</label>
                <input type="number" step="0.01" class="form-control" placeholder="Subtotal" name="subtotal">
            </div>
            <div class="mb-3">
                <label class="form-label">Total:</label>
                <input type="number" step="0.01" class="form-control" placeholder="Total" name="total">
            </div>
            <button type="submit" class="btn btn-outline-info m-auto" name="btnGuardar" value="ok">Guardar</button>
        </fieldset>
    </form>

    <?php
    $sql = $conexion->query("SELECT id, codigo, fecha, hora, estado, observaciones, descripcion, detalle, concepto, impuesto, subtotal, total FROM carroCompras");
    ?>

    <table class="table">
        <thead class="bg-info">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Código</th>
            <th scope="col">Fecha</th>
            <th scope="col">Hora</th>
            <th scope="col">Estado</th>
            <th scope="col">Observaciones</th>
            <th scope="col">Descripción</th>
            <th scope="col">Detalle</th>
            <th scope="col">Concepto</th>
            <th scope="col">Impuesto</th>
            <th scope="col">Subtotal</th>
            <th scope="col">Total</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <?php while($datos = $sql->fetch_object()){ ?>
            <tr>
                <th scope="row"><?= $datos->id ?></th>
                <td><?= $datos->codigo ?></td>
                <td><?= $datos->fecha ?></td>
                <td><?= $datos->hora ?></td>
                <td><?= $datos->estado ?></td>
                <td><?= $datos->observaciones ?></td>
                <td><?= $datos->descripcion ?></td>
                <td><?= $datos->detalle ?></td>
                <td><?= $datos->concepto ?></td>
                <td><?= $datos->impuesto ?></td>
                <td><?= $datos->subtotal ?></td>
                <td><?= $datos->total ?></td>
                <td>
                    <a href="actualizar.php?id=<?= $datos->id ?>" class="btn btn-small btn-warning"><i class="fa-solid fa-pen-to-square"></i></a>
                    <a href="eliminar/eliminarCarrito.php?=<?= $datos->id ?>" class="btn btn-small btn-danger"><i class="fa-solid fa-eraser"></i></a>
                </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>
</div>
</body>
</html>