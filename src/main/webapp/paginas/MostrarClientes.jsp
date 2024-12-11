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
<body class="d-flex w-100">
	<%@ include file="/componentes/navbar.jsp"%>


	<div
		class="w-100 d-flex h-100 justify-content-center align-items-center">
		<div class="w-100 px-100 h-100">
			<table border="1" class="w-100">
				<thead>
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
					// Obtenemos la lista de autos del request
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
						<td><a href="EditarCliente
							?id=<%=cliente.getId()%>">Editar</a>
						</td>
						<td><a
							href="EliminarCliente
                            ?id=<%=cliente.getId()%>">Eliminar</a>
						</td>
					</tr>
					<%}
}%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>

