<%@page import="java.util.ArrayList"%>
<%@page import="modelo.clases.Auto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Autos alquilados</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
</head>
<body class="d-flex w-100" style="height: 100vh; overflow: hidden;">
	<%@ include file="/componentes/navbar.jsp"%>
	<div class="d-flex flex-column w-100">
		<div class="d-flex flex-column w-100">
			<div class="container-fluid p-4"
				style="flex-grow: 1; overflow-y: auto;">
				<h2 class="text-center mb-4 text-dark">Autos Alquilados</h2>
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead class="thead-dark">
							<tr>
								<th>ID</th>
								<th>Marca</th>
								<th>Modelo</th>
								<th>Año</th>
								<th>Color</th>
								<th>Matricula</th>
								<th>Precio</th>
								<th>Estado</th>
								<th>Referencia</th>
								<th>Kilometraje</th>
							</tr>
						</thead>
						<tbody>
							<%
							ArrayList<Auto> autos = (ArrayList<Auto>) request.getAttribute("autos");
							if (autos != null) {
								for (Auto auto : autos) {
							%>
							<tr>
								<td><%=auto.getId()%></td>
								<td><%=auto.getMarca()%></td>
								<td><%=auto.getModelo()%></td>
								<td><%=auto.getAnio()%></td>
								<td><%=auto.getColor()%></td>
								<td><%=auto.getMatricula()%></td>
								<td><%=auto.getPrecio_dia()%></td>
								<td><%=auto.getEstado()%></td>
								<td><%=auto.getImg()%></td>
								<td><%=auto.getKilometraje()%></td>
							</tr>
							<%
							}
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>