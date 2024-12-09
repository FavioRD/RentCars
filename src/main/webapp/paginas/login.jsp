<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/RentCars/login" method="post">
		<label for="usuario">Usuario</label> <input type="text" id="usuario"
			name="usuario" /> <br /> <label for="clave">Clave</label> <input
			type="password" id="clave" name="clave" /> <br /> <input
			type="submit" value="Ingresar" />
	</form>
</body>
</html>