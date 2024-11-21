<?php
class Inventario {
    private $conexion;

    public function __construct($conexion) {
        $this->conexion = $conexion;
    }

    public function generarListaDesplegable() {
        $sql = $this->conexion->query("SELECT nombre FROM producto");
        echo '<select class="form-control" name="nombre">';
        while ($row = $sql->fetch_assoc()) {
            echo '<option value="' . $row['nombre'] . '">' . $row['nombre'] . '</option>';
        }
        echo '</select>';
    }

    public function generarListaDesplegableIdCiudadano() {
        $sql = $this->conexion->query("SELECT id FROM ciudadano");
        echo '<select class="form-control" name="idCiudadano">';
        while ($row = $sql->fetch_assoc()) {
            echo '<option value="' . $row['id'] . '">' . $row['id'] . '</option>';
        }
        echo '</select>';
    }

    public function generarListaDesplegableIdProducto() {
        $sql = $this->conexion->query("SELECT id FROM producto");
        echo '<select class="form-control" name="idProducto">';
        while ($row = $sql->fetch_assoc()) {
            echo '<option value="' . $row['id'] . '">' . $row['id'] . '</option>';
        }
        echo '</select>';
    }

    public function generarListaDesplegableIdCarroCompras() {
        $sql = $this->conexion->query("SELECT id FROM carrocompras");
        echo '<select class="form-control" name="idCarroCompras">';
        while ($row = $sql->fetch_assoc()) {
            echo '<option value="' . $row['id'] . '">' . $row['id'] . '</option>';
        }
        echo '</select>';
    }
}
?>