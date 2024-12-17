<%@page import="modelo.clases.Auto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body class="d-flex" style="height: 100vh;">
	<%@ include file="../componentes/navbar.jsp"%>

	<div class="mt-3 mx-5 d-flex justify-content-center flex-column gap-3">
		<h2>Listado de autos</h2>
		<div class="d-flex gap-3 flex-wrap"
			style="max-height: 80vh; overflow-y: auto; flex-wrap: wrap;">
			<%
			// Obtenemos la lista de autos del request
			ArrayList<Auto> autos = (ArrayList<Auto>) request.getAttribute("autos");
			if (autos != null) {
				for (Auto auto : autos) {
			%>
			<div class="card"
				style="width: 18rem; border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
				<!-- Contenedor para la imagen con tamaño mínimo -->
				<div
					style="height: 200px; overflow: hidden; border-top-left-radius: 15px; border-top-right-radius: 15px;">
					<img src="<%=auto.getImg()%>" class="card-img-top"
						alt="Imagen del auto"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>

				<div class="card-body">
					<!-- Título con nombre del modelo y matrícula -->
					<h5 class="card-title mb-3"
						style="font-size: 1.25rem; font-weight: bold;">
						<%=auto.getModelo() + " " + auto.getMatricula()%>
					</h5>

					<!-- Sección con los detalles del auto -->
					<ul class="list-unstyled">
						<li><strong>Marca:</strong> <%=auto.getMarca()%></li>
						<li><strong>Color:</strong> <%=auto.getColor()%></li>
						<li><strong>Año:</strong> <%=auto.getAnio()%></li>
						<li><strong>Kilometraje:</strong> <%=auto.getKilometraje()%>
							KM</li>
						<li><strong>Precio por Día:</strong> <%=auto.getPrecio_dia()%>
							USD</li>
					</ul>
					<%
					String estado = auto.getEstado().trim();
					%>
					<!-- Botón con estilo basado en el estado -->
					<span
						class="btn <%=estado.equals("Disponible") ? "btn-success" : "btn-warning"%> w-100 mt-3"
						style="border-radius: 25px;"> <%=estado%>
					</span>

					<!-- Mostrar botones según el estado del auto -->
					<%
					if (estado.equals("Disponible")) {
					%>
					<!-- Botón para alquilar si el auto está disponible -->
					<a href="alquilarAuto?accion=alquilar&id=<%=auto.getId()%>"
						class="btn btn-primary w-100 mt-3" style="border-radius: 25px;">
						Alquilar </a>
					<%
					} else if (estado.equals("Alquilado")) {
					%>
					<!-- Botón de opciones si el auto está alquilado -->
					<a href="alquilarAuto?accion=opcionAlquiler&id_auto=<%=auto.getId()%>"
						class="btn btn-secondary w-100 mt-3" style="border-radius: 25px;">
						Opciones de Alquiler </a>
					<%
					}
					%>
					<div class="dropdown btn w-100 mt-3">
						<button class="btn w-100 btn-secondary dropdown-toggle" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">Mantenimiento</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="autos?action=modificarAuto&id=<%= auto.getId() %>">Modificar Auto</a></li>
							<li><a class="dropdown-item" href="autos?action=borrarAuto&id=<%=auto.getId()%>">Borrar Auto</a></li>	
						</ul>
					</div>
				</div>

			</div>
			<%
			}
			}
			%>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>