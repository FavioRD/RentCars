<%@page import="modelo.clases.Auto"%>
<%@page import="modelo.clases.Cliente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Auto auto = (Auto) request.getAttribute("auto");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Alquilar Auto</title>
</head>
<body>
	<form action="alquilarAuto" method="post">

		<!-- Campo para ingresar el cliente -->

		<label for="id_cliente">Cliente:</label> <select id="id_cliente"
			name="id_cliente">
			<%
			List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
			if (clientes != null) {
				for (Cliente c : clientes) {
			%>
			<option value="<%=c.getId()%>"><%=c.getNombre()%></option>
			<%
			}
			}
			%>
			
		

		</select>

		<!-- Campo para ingresar el auto -->
		<label for="auto">Auto:</label> <input name="auto" type="text"
			id="auto"
			value="<%=auto.getMarca() + " " + auto.getModelo() + " " + auto.getMatricula()%>"
			disabled> <br> <br>

		<!-- Campo para ingresar el id_auto -->
		<input name="id_auto" type="hidden" value="<%=auto.getId()%>">


		<!-- Campo para la fecha de inicio del alquiler -->
		<label for="fecha_inicio">Fecha de Inicio:</label> <input
			name="fecha_inicio" type="date" id="fecha_inicio" required> <br>
		<br>

		<!-- Campo para la fecha de fin del alquiler -->
		<label for="fecha_fin">Fecha de Fin:</label> <input name="fecha_fin"
			type="date" id="fecha_fin" required> <br> <br>

		<!-- Campo para ingresar el precio total del alquiler -->
		<label for="precio_por_dia">Precio por dia:</label> <input
			name="precio_por_dia" value="<%=auto.getPrecio_dia()%>" type="number"
			step="0.01" id="precio_por_dia" disabled> <br> <br>


		<!-- Campo para ingresar el precio total del alquiler -->
		<label for="precio_total">Precio Total:</label> <input
			name="precio_total" type="number" step="0.01"
			id="precio_total"> <br> <br>


		<!-- Campo para seleccionar el estado del alquiler -->
		<label for="estado_alquiler">Estado del Alquiler:</label> <select
			name="estado_alquiler" id="estado_alquiler" required>
			<option value="activo">Activo</option>
			<option value="finalizado">Finalizado</option>
			<option value="pendiente">Pendiente</option>
		</select> <br> <br>

		<!-- Botón de envío -->
		<button type="submit">Alquilar Auto</button>

	</form>

	<script>
    // Obtener elementos del DOM
    const fechaInicioInput = document.getElementById('fecha_inicio');
    const fechaFinInput = document.getElementById('fecha_fin');
    const precioPorDiaInput = document.getElementById('precio_por_dia');
    const precioTotalInput = document.getElementById('precio_total');

    // Función para calcular el precio total
    function calcularPrecioTotal() {
        const fechaInicio = new Date(fechaInicioInput.value);
        const fechaFin = new Date(fechaFinInput.value);
        const precioPorDia = parseFloat(precioPorDiaInput.value);

        // Verificar que las fechas sean válidas
        if (!isNaN(fechaInicio) && !isNaN(fechaFin) && fechaFin >= fechaInicio) {
            const diferenciaDias = (fechaFin - fechaInicio) / (1000 * 60 * 60 * 24); // Diferencia en días
            const precioTotal = diferenciaDias * precioPorDia;

            // Mostrar el precio total
            precioTotalInput.value = precioTotal.toFixed(2);
        } else {
            precioTotalInput.value = ''; // Limpiar si las fechas son inválidas
        }
    }

    // Agregar eventos a los campos de fecha
    fechaInicioInput.addEventListener('change', calcularPrecioTotal);
    fechaFinInput.addEventListener('change', calcularPrecioTotal);
</script>
</body>
</html>