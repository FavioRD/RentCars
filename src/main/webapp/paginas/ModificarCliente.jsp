<%@ page import="modelo.clases.Cliente" %>

<% 
    Cliente cliente = (Cliente) request.getAttribute("cliente");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Modificar Cliente</title>
</head>
<body>
    <h2>Modificar Cliente</h2>
	<form action="cliente?action=modificarCliente" method="post">
		<input type="hidden" name="id" value="<%=cliente.getId()%>">
		<div>
			<label for="nombre">Nombre</label> <input type="text" id="nombre"
				name="nombre" value="<%=cliente.getNombre()%>">
		</div>
		<div>
			<label for="documento">Documento</label> <input type="text"
				id="documento" name="documento" value="<%=cliente.getDocumento()%>">
		</div>
		<div>
			<label for="direccion">Dirección</label> <input type="text"
				id="direccion" name="direccion" value="<%=cliente.getDireccion()%>">
		</div>
		<div>
			<label for="telefono">Teléfono</label> <input type="text"
				id="telefono" name="telefono" value="<%=cliente.getTelefono()%>">
		</div>
		<div>
			<label for="correo">Correo</label> <input type="text" id="correo"
				name="correo" value="<%=cliente.getCorreo()%>">
		</div>
		<button type="submit">Modificar</button>
</body>
</html>

