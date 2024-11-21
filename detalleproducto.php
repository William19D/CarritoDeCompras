<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/e3700bf5e9.js" crossorigin="anonymous"></script>
    <title>Detalle Producto</title>
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

        $sql = $conexion->prepare("INSERT INTO detalleproducto (idCarroCompras, idProducto, estado, cantidad, concepto, monto, impuesto, subtotal, fechaEntrega, fechaPrestamo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $sql->bind_param("iisissddss", $idCarroCompras, $idProducto, $estado, $cantidad, $concepto, $monto, $impuesto, $subtotal, $fechaEntrega, $fechaPrestamo);

        if ($sql->execute()) {
            echo '<div class="alert alert-success">Detalle de producto guardado exitosamente</div>';
        } else {
            echo '<div class="alert alert-danger">Error al guardar el detalle del producto</div>';
        }
    }
    ?>

    <form class="col-4 p-3" method="POST">
        <fieldset>
            <h3 class="text-center text-secondary">Detalle Producto</h3>
            <div class="mb-3">
                <label class="form-label">ID Carro Compras:</label>
                <input type="text" class="form-control" placeholder="ID Carro Compras" name="idCarroCompras" required>
            </div>
            <div class="mb-3">
                <label class="form-label">ID Producto:</label>
                <input type="text" class="form-control" placeholder="ID Producto" name="idProducto" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Estado:</label>
                <input type="text" class="form-control" placeholder="Estado" name="estado" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Cantidad:</label>
                <input type="number" class="form-control" placeholder="Cantidad" name="cantidad" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Concepto:</label>
                <input type="text" class="form-control" placeholder="Concepto" name="concepto" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Monto:</label>
                <input type="number" step="0.01" class="form-control" placeholder="Monto" name="monto" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Impuesto:</label>
                <input type="number" step="0.01" class="form-control" placeholder="Impuesto" name="impuesto" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Subtotal:</label>
                <input type="number" step="0.01" class="form-control" placeholder="Subtotal" name="subtotal" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Fecha de Entrega:</label>
                <input type="date" class="form-control" name="fechaEntrega" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Fecha de Préstamo:</label>
                <input type="date" class="form-control" name="fechaPrestamo" required>
            </div>
            <button type="submit" class="btn btn-outline-info m-auto" name="btnGuardar" value="ok">Guardar</button>
        </fieldset>
    </form>

    <?php
    $sql = $conexion->query("SELECT id, idCarroCompras, idProducto, estado, cantidad, concepto, monto, impuesto, subtotal, fechaEntrega, fechaPrestamo FROM detalleproducto");
    ?>

    <table class="table">
        <thead class="bg-info">
        <tr>
            <th scope="col">#</th>
            <th scope="col">ID Carro Compras</th>
            <th scope="col">ID Producto</th>
            <th scope="col">Estado</th>
            <th scope="col">Cantidad</th>
            <th scope="col">Concepto</th>
            <th scope="col">Monto</th>
            <th scope="col">Impuesto</th>
            <th scope="col">Subtotal</th>
            <th scope="col">Fecha de Entrega</th>
            <th scope="col">Fecha de Préstamo</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <?php while($datos = $sql->fetch_object()){ ?>
            <tr>
                <th scope="row"><?= $datos->id ?></th>
                <td><?= $datos->idCarroCompras ?></td>
                <td><?= $datos->idProducto ?></td>
                <td><?= $datos->estado ?></td>
                <td><?= $datos->cantidad ?></td>
                <td><?= $datos->concepto ?></td>
                <td><?= $datos->monto ?></td>
                <td><?= $datos->impuesto ?></td>
                <td><?= $datos->subtotal ?></td>
                <td><?= $datos->fechaEntrega ?></td>
                <td><?= $datos->fechaPrestamo ?></td>
                <td>
                    <a href="actualizarDetalle.php?id=<?= $datos->id ?>" class="btn btn-small btn-warning"><i class="fa-solid fa-pen-to-square"></i></a>
                    <a href="eliminar/eliminarDetalle.php?id=<?= $datos->id ?>" class="btn btn-small btn-danger"><i class="fa-solid fa-eraser"></i></a>
                </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>
</div>
</body>
</html>