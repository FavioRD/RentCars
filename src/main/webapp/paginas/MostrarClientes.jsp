<%@page import="java.util.ArrayList"%>
<%@ page import="modelo.clases.Cliente"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Lista de Clientes</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body class="d-flex w-100" style="height: 100vh; overflow: hidden;">
	<%@ include file="/componentes/navbar.jsp"%>
	<!-- Sidebar (navbar) -->

	<!-- Contenido principal -->
	<div class="d-flex flex-column w-100">
		<!-- Contenedor de la tabla -->
		<div class="container-fluid p-4"
			style="flex-grow: 1; overflow-y: auto;">
			<h2 class="text-center mb-4 text-dark">Mantenimiento de Clientes</h2>
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<thead class="thead-dark">
						<tr>
							<th>ID</th>
							<th>Nombre</th>
							<th>DNI</th>
							<th>Dirección</th>
							<th>Teléfono</th>
							<th>Correo</th>
							<th>Acción</th>
							<th>Eliminar</th>
						</tr>
					</thead>
					<tbody>
						<%
						// Obtenemos la lista de clientes del request
						ArrayList<Cliente> clientes = (ArrayList<Cliente>) request.getAttribute("clientes");
						
						if (clientes != null) {
							for (Cliente cliente : clientes) {
						%>
						<tr>
							<td><%=cliente.getId()%></td>
							<td><%=cliente.getNombre()%></td>
							<td><%=cliente.getDocumento()%></td>
							<td><%=cliente.getDireccion()%></td>
							<td><%=cliente.getTelefono()%></td>
							<td><%=cliente.getCorreo()%></td>
							<td><a href="EditarCliente?id=<%=cliente.getId()%>"
								class="btn btn-warning btn-sm">Editar</a></td>
							<td><a href="EliminarCliente?id=<%=cliente.getId()%>"
								class="btn btn-danger btn-sm">Eliminar</a></td>
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

	<!-- Scripts de Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>

</html>

