<%@page import="java.util.ArrayList"%>
<%@ page import="modelo.clases.Cliente" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
</head>
<body>
    <h1>Lista de Clientes</h1>
    
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Documento</th>
                <th>Dirección</th>
                <th>Teléfono</th>
                <th>Correo</th>
            </tr>
        </thead>
        <tbody>
            <%
			// Obtenemos la lista de autos del request
			ArrayList<Cliente> clientes = (ArrayList<Cliente>) request.getAttribute("clientes");
			if (clientes != null) {
				for (Cliente cliente: clientes) {
			%>
			<tr>
				<td><%=cliente.getId()%></td>
				<td><%=cliente.getNombre()%></td>
				<td><%=cliente.getDocumento()%></td>
				<td><%=cliente.getDireccion()%></td>
				<td><%=cliente.getTelefono()%></td>
				<td><%=cliente.getCorreo()%></td>
			</tr>
			<%
			}
			}
			%>
        </tbody>
    </table>
</body>
</html>

