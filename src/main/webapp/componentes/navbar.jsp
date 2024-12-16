
<%@page import="modelo.clases.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<nav class="d-flex flex-column bg-info-subtle vh-100 shadow-sm"
		style="width: 250px; min-width: 250px">
		<div class="text-center py-5 border-bottom">
			<a
				href="${pageContext.request.contextPath}/controlador?action=volverInicio">
				<img class="rounded-circle"
				src="https://media.istockphoto.com/id/1290071290/vector/rental-car-icon.jpg?s=612x612&w=0&k=20&c=q4EsvU3jJJYbcZTJ1EzKh6c-Dvy39HagvAUgTCRK9bE="
				alt="Logo" style="width: 100px; height: 100px; object-fit: cover" />
			</a>
		</div>

		<ul
			class="d-flex flex-column justify-content-center gap-3 list-unstyled w-100 px-3 mb-0 flex-grow-1">

			<%
			HttpSession sesion = request.getSession();

			Usuario usuario = (Usuario) sesion.getAttribute("usuario");
			%>

			<%
			if (usuario.getRol().trim().equals("Administrador")) {
			%>
			<li>
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">
						Mantenimiento Auto</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="autos?action=agregarAuto">Agregar
								Auto</a></li>
						<li><a class="dropdown-item" href="#">Borrar Auto</a></li>
						<li><a
							href="${pageContext.request.contextPath}/autos?action=verAutos"
							class="dropdown-item">Listar Autos</a></li>
						<li>
					</ul>
				</div>
			</li>

			<%
			}
			%>

			<a
				href="${pageContext.request.contextPath}/paginas/VerAlquilados.jsp"
				class="text-decoration-none d-block py-3 px-3 rounded bg-light shadow-sm">Ver
				Autos Alquilados</a>
			</li>

			<li><a href="${pageContext.request.contextPath}/cliente"
				class="text-decoration-none d-block py-4 px-3 bg-light rounded">Alquilar
					Auto</a></li>
			<li><a href="${pageContext.request.contextPath}/cliente"
				class="text-decoration-none d-block py-3 px-3 rounded bg-light shadow-sm">Mantenimiento
					Clientes</a></li>

			<li>
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">
						Reportes</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="autos?action=autosConMasKilometraje">Autos con mas kilometraje</a></li>
						<li><a class="dropdown-item" href="#">Clientes que mas veces alquilaron</a></li>
						
					</ul>
				</div>
			</li>
		</ul>

		<div class="text-center py-4 border-top">
			<a
				href="${pageContext.request.contextPath}/controlador?action=cerrarSesion"
				class="text-decoration-none d-block py-3 px-3 bg-light rounded shadow-sm">Cerrar
				Sesión</a>
		</div>
	</nav>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
</body>
</html>
