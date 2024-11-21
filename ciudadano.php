<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/e3700bf5e9.js" crossorigin="anonymous"></script>
    <title>Ciudadanos</title>
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
        $cedula = $_POST['cedula'];
        $nombre = $_POST['nombre'];
        $apellido = $_POST['apellido'];
        $direccion = $_POST['direccion'];
        $estado = $_POST['estado'];
        $telefono = $_POST['telefono'];
        $email = $_POST['email'];
        $fechaNacimiento = $_POST['fechaNacimiento'];
        $genero = $_POST['genero'];

        $sql = $conexion->prepare("INSERT INTO ciudadano (cedula, nombre, apellido, direccion, estado, telefono, email, fechaNacimiento, genero) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $sql->bind_param("sssssssss", $cedula, $nombre, $apellido, $direccion, $estado, $telefono, $email, $fechaNacimiento, $genero);

        if ($sql->execute()) {
            echo '<div class="alert alert-success">Ciudadano guardado exitosamente</div>';
        } else {
            echo '<div class="alert alert-danger">Error al guardar el ciudadano</div>';
        }
    }
    ?>

    <form class="col-4 p-3" method="POST">
        <fieldset>
            <h3 class="text-center text-secondary">Ciudadanos</h3>
            <div class="mb-3">
                <label class="form-label">Cédula:</label>
                <input type="text" class="form-control" placeholder="Cédula del Ciudadano" name="cedula">
            </div>
            <div class="mb-3">
                <label class="form-label">Nombre:</label>
                <input type="text" class="form-control" placeholder="Nombre del Ciudadano" name="nombre">
            </div>
            <div class="mb-3">
                <label class="form-label">Apellido:</label>
                <input type="text" class="form-control" placeholder="Apellido del Ciudadano" name="apellido">
            </div>
            <div class="mb-3">
                <label class="form-label">Dirección:</label>
                <textarea class="form-control" placeholder="Dirección del Ciudadano" name="direccion"></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Estado:</label>
                <input type="text" class="form-control" placeholder="Estado" name="estado">
            </div>
            <div class="mb-3">
                <label class="form-label">Teléfono:</label>
                <input type="text" class="form-control" placeholder="Teléfono" name="telefono">
            </div>
            <div class="mb-3">
                <label class="form-label">Email:</label>
                <input type="email" class="form-control" placeholder="Email" name="email">
            </div>
            <div class="mb-3">
                <label class="form-label">Fecha de Nacimiento:</label>
                <input type="date" class="form-control" name="fechaNacimiento">
            </div>
            <div class="mb-3">
                <label class="form-label">Género:</label>
                <input type="text" class="form-control" placeholder="Género" name="genero">
            </div>
            <button type="submit" class="btn btn-outline-info m-auto" name="btnGuardar" value="ok">Guardar</button>
        </fieldset>
    </form>

    <?php
    $sql = $conexion->query("SELECT id, cedula, nombre, apellido, direccion, estado, telefono, email, fechaNacimiento, genero FROM ciudadano");
    ?>

    <table class="table">
        <thead class="bg-info">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Cédula</th>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido</th>
            <th scope="col">Dirección</th>
            <th scope="col">Estado</th>
            <th scope="col">Teléfono</th>
            <th scope="col">Email</th>
            <th scope="col">Fecha de Nacimiento</th>
            <th scope="col">Género</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <?php while($datos = $sql->fetch_object()){ ?>
            <tr>
                <th scope="row"><?= $datos->id ?></th>
                <td><?= $datos->cedula ?></td>
                <td><?= $datos->nombre ?></td>
                <td><?= $datos->apellido ?></td>
                <td><?= $datos->direccion ?></td>
                <td><?= $datos->estado ?></td>
                <td><?= $datos->telefono ?></td>
                <td><?= $datos->email ?></td>
                <td><?= $datos->fechaNacimiento ?></td>
                <td><?= $datos->genero ?></td>
                <td>
                    <a href="actualizar.php?id=<?= $datos->id ?>" class="btn btn-small btn-warning"><i class="fa-solid fa-pen-to-square"></i></a>
                    <a href="eliminar/eliminarCliente.php?id=<?= $datos->id ?>" class="btn btn-small btn-danger"><i class="fa-solid fa-eraser"></i></a>
                </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>
</div>
</body>
</html>