<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alquilar Auto</title>
</head>
<body>
<form action="alquilarAuto" method="post">

        <!-- Campo para ingresar el id_cliente -->
        <label for="id_cliente">ID Cliente:</label>
        <input name="id_cliente" type="text" id="id_cliente" required>
        <br><br>

        <!-- Campo para ingresar el id_auto -->
        <label for="id_auto">ID Auto:</label>
        <input name="id_auto" type="text" id="id_auto" required>
        <br><br>

        <!-- Campo para la fecha de inicio del alquiler -->
        <label for="fecha_inicio">Fecha de Inicio:</label>
        <input name="fecha_inicio" type="date" id="fecha_inicio" required>
        <br><br>

        <!-- Campo para la fecha de fin del alquiler -->
        <label for="fecha_fin">Fecha de Fin:</label>
        <input name="fecha_fin" type="date" id="fecha_fin" required>
        <br><br>

        <!-- Campo para ingresar el precio total del alquiler -->
        <label for="precio_total">Precio Total:</label>
        <input name="precio_total" type="number" step="0.01" id="precio_total" required>
        <br><br>

        <!-- Campo para seleccionar el estado del alquiler -->
        <label for="estado_alquiler">Estado del Alquiler:</label>
        <select name="estado_alquiler" id="estado_alquiler" required>
            <option value="activo">Activo</option>
            <option value="finalizado">Finalizado</option>
            <option value="pendiente">Pendiente</option>
        </select>
        <br><br>

        <!-- Botón de envío -->
        <button type="submit">Alquilar Auto</button>

    </form>
</body>
</html>