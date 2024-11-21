<?php
class Inventario {
    private $conexion;

    public function __construct($conexion) {
        $this->conexion = $conexion;
    }

    public function generarListaDesplegable() {
        $sql = $this->conexion->query("SELECT concepto FROM detalleproducto");
        echo '<select class="form-control" name="concepto">';
        while ($row = $sql->fetch_assoc()) {
            echo '<option value="' . $row['concepto'] . '">' . $row['concepto'] . '</option>';
        }
        echo '</select>';
    }
}
?>