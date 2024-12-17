<%@page import="modelo.clases.Cliente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lista de Clientes</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEJr+udz4p5+TY3P2o6h4z0BjpDPI6xj4wXYhFmwzV4M3Hv3r5Sgr9JHhKlVt"
	crossorigin="anonymous">
</head>
<body class="d-flex w-100" style="height: 100vh; overflow: hidden;">
    <%@ include file="/componentes/navbar.jsp"%>
	<div class="container mt-5">
		<h1 class="text-center mb-4">Lista de Clientes</h1>

		<!-- Tabla con estilo de Bootstrap -->
		<div class="table-responsive">
			<table
				class="table table-striped table-bordered table-hover shadow-lg">
				<thead class="thead-dark bg-primary text-white">
					<tr>
						<th>#</th>
						<th>Nombre</th>
						<th>Teléfono</th>
						<th>Documento</th>
						<th>Veces Alquilado</th>
					</tr>
				</thead>
				<tbody>
					<%
					// Obtener el ArrayList de clientes desde el atributo 'clientes' de la request
					ArrayList<Cliente> clientes = (ArrayList<Cliente>) request.getAttribute("clientes");

					// Verificar si la lista no está vacía
					if (clientes != null) {
						// Recorrer la lista de clientes
						for (Cliente cliente : clientes) {
					%>
					<tr>
						<td><%=cliente.getId()%></td>
						<td><%=cliente.getNombre()%></td>
						<td><%=cliente.getTelefono()%></td>
						<td><%=cliente.getDocumento()%></td>
						<td><%=cliente.getCantidadVecesAlquilado()%></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="5" class="text-center">No hay clientes
							disponibles</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>


	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz4fnFO9gybY4wsdB07v3cc/g11dQn4d+22jLlP7he6j0K6RXt4S2lA9k7p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
		integrity="sha384-pzjw8f+ua7Kw1TIq0z59zZQkUduJ6wHCgQoBshn5lYQ81f4lgK5bh6uL5f91V7tk"
		crossorigin="anonymous"></script>
</body>
</html>
