<%@page import="modelo.clases.Alquiler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Opciones de Alquiler</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	background-color: #f4f4f9;
}

.container {
	max-width: 600px;
	margin: 0 auto;
	background: #fff;
	padding: 20px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	border-radius: 8px;
}

h1 {
	font-size: 24px;
	color: #333;
	text-align: center;
}

.info {
	margin: 10px 0;
}

.btn {
	display: inline-block;
	margin: 5px 0;
	padding: 10px 20px;
	background: #007BFF;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	text-align: center;
}

.btn:hover {
	background: #0056b3;
}
</style>
</head>
<body>
	<%
	Alquiler alquiler = (Alquiler) request.getAttribute("alquiler");
	String id_auto = request.getParameter("id_auto");
	%>
	<div class="container">
		<h1>Opciones de Alquiler</h1>

		<div class="info">
			<p>
				<strong>Estado Alquiler:</strong>
				<%=alquiler.getEstadoAlquiler()%>
			</p>
		</div>

		
		<form action="alquilarAuto?accion=finalizarAlquiler&id_alquiler=<%=alquiler.getIdAlquiler() %>" method="post">
			<input type="number" name="km_recorridos" placeholder="Kilometros recorridos" >
			<input type="hidden" value="<%= id_auto  %>" name="id_auto">
			<button type="submit" class="btn">Finalizar Alquiler</button>
		</form>



	
	</div>

</body>
</html>
