<%@ page import="modelo.clases.Cliente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Formulario de Registro de Cliente</title>
</head>
<body>

	<h2>Formulario de Registro de Cliente</h2>

	<form action="cliente?action=agregarCliente" method="post">
    <input type="hidden" value="1" name="id"> 
    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" required><br>
    <br> 
    <label for="documento">Documento de Identidad:</label> 
    <input type="text" id="documento" name="documento" required><br>
    <br> 
    <label for="direccion">Dirección:</label> 
    <input type="text" id="direccion" name="direccion" required><br> 
    <br>
    <label for="telefono">Teléfono:</label> 
    <input type="tel" id="telefono" name="telefono" required><br> 
    <br> 
    <label for="correo">Correo Electrónico:</label> 
    <input type="email" id="correo" name="correo" required><br> 
    <br>
    <button type="submit">Registrar Cliente</button>
</form>

</body>
</html>
