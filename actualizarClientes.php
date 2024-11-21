<?php
include "conexion.php";

// Verificamos si se ha pasado el ID como parámetro en la URL
if (!isset($_GET['id']) || empty($_GET['id'])) {
    echo '<div class="alert alert-danger">No se proporcionó un ID válido para modificar.</div>';
    exit;
}

$id = $_GET['id'];

// Consultamos los datos del ciudadano a modificar
$sql = $conexion->prepare("SELECT cedula, nombre, apellido, direccion, estado, telefono, email, fechaNacimiento, genero FROM ciudadano WHERE id = ?");
$sql->bind_param("i", $id);
$sql->execute();
$resultado = $sql->get_result();

if ($resultado->num_rows === 0) {
    echo '<div class="alert alert-danger">No se encontró el ciudadano con el ID proporcionado.</div>';
    exit;
}

$ciudadano = $resultado->fetch_object();

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['btnActualizar'])) {
    // Obtenemos los valores del formulario
    $cedula = $_POST['cedula'];
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $direccion = $_POST['direccion'];
    $estado = $_POST['estado'];
    $telefono = $_POST['telefono'];
    $email = $_POST['email'];
    $fechaNacimiento = $_POST['fechaNacimiento'];
    $genero = $_POST['genero'];

    // Actualizamos los datos del ciudadano
    $updateSql = $conexion->prepare(
        "UPDATE ciudadano SET cedula = ?, nombre = ?, apellido = ?, direccion = ?, estado = ?, telefono = ?, email = ?, fechaNacimiento = ?, genero = ? WHERE id = ?"
    );
    $updateSql->bind_param("sssssssssi", $cedula, $nombre, $apellido, $direccion, $estado, $telefono, $email, $fechaNacimiento, $genero, $id);

    if ($updateSql->execute()) {
        echo '<div class="alert alert-success">Ciudadano actualizado exitosamente.</div>';
        header("Location: ../ciudadano.php");
    } else {
        echo '<div class="alert alert-danger">Error al actualizar el ciudadano.</div>';
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
    <title>Actualizar Ciudadano</title>
    </head>
<body>
<?php
include "navbar.php";
?>
<div class="container p-5">
    <h3 class="text-center text-secondary">Actualizar Ciudadano</h3>
    <form method="POST">
        <div class="mb-3">
            <label class="form-label">Cédula:</label>
            <input type="text" class="form-control" name="cedula" value="<?= $ciudadano->cedula ?>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Nombre:</label>
            <input type="text" class="form-control" name="nombre" value="<?= $ciudadano->nombre ?>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Apellido:</label>
            <input type="text" class="form-control" name="apellido" value="<?= $ciudadano->apellido ?>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Dirección:</label>
            <textarea class="form-control" name="direccion" required><?= $ciudadano->direccion ?></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Estado:</label>
            <input type="text" class="form-control" name="estado" value="<?= $ciudadano->estado ?>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Teléfono:</label>
            <input type="text" class="form-control" name="telefono" value="<?= $ciudadano->telefono ?>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Email:</label>
            <input type="email" class="form-control" name="email" value="<?= $ciudadano->email ?>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Fecha de Nacimiento:</label>
            <input type="date" class="form-control" name="fechaNacimiento" value="<?= $ciudadano->fechaNacimiento ?>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Género:</label>
            <input type="text" class="form-control" name="genero" value="<?= $ciudadano->genero ?>" required>
        </div>
        <button type="submit" class="btn btn-outline-info" name="btnActualizar" value="ok">Actualizar</button>
    </form>
</div>
</body>
</html>
