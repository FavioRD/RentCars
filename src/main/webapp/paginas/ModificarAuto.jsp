<%@page import="modelo.clases.Auto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Auto auto = (Auto) request.getAttribute("auto");
	%>
	<form action="autos?action=modificarAuto" method="post">
		<input type="hidden" name="id" value="${auto.getId()}"> <label>Modelo</label>
		<input type="text" name="modelo" value="${auto.getModelo()}">
		<label>Marca</label> <input type="text" name="marca"
			value="${auto.getMarca()}"> <label>Color</label> <input
			type="text" name="color" value="${auto.getColor()}"> <label>Año</label>
		<input type="text" name="anio" value="${auto.getAnio()}"> <label>Matrícula</label>
		<input type="text" name="matricula" value="${auto.getMatricula()}">
		<label>Precio por día</label> <input type="text" name="precioDia"
			value="${auto.getPrecio_dia()}"> <label>Estado</label> <select name="estado"
			required>
			<option value="Disponible"
				${auto.getEstado().equals("Disponible") ? "selected" : ""}>Disponible</option>
			<option value="Alquilado"
				${auto.getEstado().equals("Alquilado") ? "selected" : ""}>Alquilado</option>

		</select> <label>Imagen</label> <input type="text" name="img"
			value="${auto.getImg()}">
		<button type="submit">Guardar</button>

	</form>

</body>
</html>