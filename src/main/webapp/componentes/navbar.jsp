<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="d-flex flex-column bg-info-subtle vh-100"
		style="width: 250px; min-width: 250px;">
		<!-- Título con el logo -->
		<div class="text-center py-5 border-bottom">
			<a href="${pageContext.request.contextPath}/controlador?action=volverInicio"> <img
				class="rounded-circle"
				src="https://media.istockphoto.com/id/1290071290/vector/rental-car-icon.jpg?s=612x612&w=0&k=20&c=q4EsvU3jJJYbcZTJ1EzKh6c-Dvy39HagvAUgTCRK9bE="
				alt="Logo" style="width: 100px; height: 100px; object-fit: cover;">
			</a>
		</div>

		<!-- Menú -->
		<ul
			class="d-flex flex-column justify-content-center gap-3 list-unstyled w-100 px-3 mb-0 flex-grow-1">
			<li><a
				href="${pageContext.request.contextPath}/paginas/AgregarAuto.jsp"
				class="text-decoration-none d-block py-4 px-3 bg-light rounded">Mantenimiento Autos</a></li>
			<li><a
				href="${pageContext.request.contextPath}/autos?action=verAutos"
				class="text-decoration-none d-block py-4 px-3 bg-light rounded">Listar Autos</a></li>
			<li><a
				href="${pageContext.request.contextPath}/paginas/VerAlquilados.jsp"
				class="text-decoration-none d-block py-4 px-3 bg-light rounded">Ver
					Autos Alquilados</a></li>
			<li><a
				href="${pageContext.request.contextPath}/paginas/AlquilarAuto.jsp"
				class="text-decoration-none d-block py-4 px-3 bg-light rounded">Alquilar
					Auto</a></li>
					<li><a
				href="${pageContext.request.contextPath}/cliente"
				class="text-decoration-none d-block py-4 px-3 bg-light rounded">Alquilar
					Auto</a></li>
		</ul>
		<!-- Botón de cerrar sesión -->
		<div class="text-center py-5">
			<a
				href="${pageContext.request.contextPath}/controlador?action=cerrarSesion"
				class="text-decoration-none d-block py-4 px-3 bg-light rounded">Cerrar
				Sesión</a>
		</div>
	</nav>

</body>
</html>