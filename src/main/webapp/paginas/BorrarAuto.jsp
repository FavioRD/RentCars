<%@page import="modelo.clases.Auto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Auto auto = (Auto) request.getAttribute("auto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrar Auto</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body class="d-flex w-100" style="height: 100vh; overflow: hidden;">
<%@ include file="/componentes/navbar.jsp"%>
<h1>Borrar Auto</h1>
	<form action="autos?action=borrarAuto" method="post">
		<div class="modal-body">
		<input type="hidden" name="id" value="<%=auto.getId()%>">
			<div class="form-group">
				<label for="marca">Marca</label> <input type="text"
					class="form-control" id="modelo" disabled="disabled" value="<%=auto.getMarca()%>">
			</div>
			<div class="form-group">
				<label for="modelo">Modelo</label> <input type="text"
					class="form-control" id="modelo" disabled="disabled"value="<%=auto.getModelo()%>">
			</div>
			<div class="form-group">
				<label for="anio">Año</label> <input type="text"
					class="form-control" id="modelo" disabled="disabled" value="<%=auto.getAnio()%>">
			</div>
			<div class="form-group">
				<label for="color">Color</label> <input type="text"
					class="form-control" id="modelo" disabled="disabled" value="<%=auto.getColor()%>">
			</div>
			<div class="form-group">
				<label for="color">Matricula</label> <input type="text"
					class="form-control" id="modelo" disabled="disabled" value="<%=auto.getMatricula()%>">
			</div>
			<div class="form-group">
				<label for="color">Kilometraje</label> <input type="text"
					class="form-control" id="modelo" disabled="disabled" value="<%=auto.getKilometraje()%>">
			</div>
			<div class="form-group">
				<label for="color">Precio por dia</label> <input type="text"
					class="form-control" id="modelo" disabled="disabled" value="<%=auto.getPrecio_dia()%>">
			</div>
			<div class="form-group">
				<label for="color">Estado</label> <input type="text"
					class="form-control" id="modelo" disabled="disabled" value="<%=auto.getEstado()%>">
			</div>
		</div>

		<div class="modal-footer">
			<button type="submit" class="btn btn-primary">Borrar</button>
			<a href="autos?action=verAutos" class="btn btn-secondary">Cancelar</a>
		</div>
	</form>
</body>
</html>