<?php
class Inventario {
    private $conexion;

    public function __construct($conexion) {
        $this->conexion = $conexion;
    }

    // Método para generar lista desplegable de 'detalleproducto' en orden alfabético
    public function generarListaDesplegable() {
        $sql = $this->conexion->query("SELECT concepto FROM detalleproducto ORDER BY concepto ASC");
        echo '<select class="form-control" name="detalle">';
        while ($row = $sql->fetch_assoc()) {
            echo '<option value="' . $row['concepto'] . '">' . $row['concepto'] . '</option>';
        }
        echo '</select>';
    }

    // Método para generar lista desplegable de 'ciudadano' ordenada por 'id'
    public function generarListaDesplegableIdCiudadano() {
        $sql = $this->conexion->query("SELECT id FROM ciudadano ORDER BY id ASC");
        echo '<select class="form-control" name="idCiudadano">';
        while ($row = $sql->fetch_assoc()) {
            echo '<option value="' . $row['id'] . '">' . $row['id'] . '</option>';
        }
        echo '</select>';
    }

    // Método para generar lista desplegable de 'producto' ordenada por 'id'
    public function generarListaDesplegableIdProducto() {
        $sql = $this->conexion->query("SELECT id FROM producto ORDER BY id ASC");
        echo '<select class="form-control" name="idProducto">';
        while ($row = $sql->fetch_assoc()) {
            echo '<option value="' . $row['id'] . '">' . $row['id'] . '</option>';
        }
        echo '</select>';
    }

    // Método para generar lista desplegable de 'carrocompras' ordenada por 'id'
    public function generarListaDesplegableIdCarroCompras() {
        $sql = $this->conexion->query("SELECT id FROM carrocompras ORDER BY id ASC");
        echo '<select class="form-control" name="idCarroCompras">';
        while ($row = $sql->fetch_assoc()) {
            echo '<option value="' . $row['id'] . '">' . $row['id'] . '</option>';
        }
        echo '</select>';
    }
}
?>
