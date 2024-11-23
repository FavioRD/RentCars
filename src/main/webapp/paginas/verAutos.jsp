<%@page import="clases.Auto"%>
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
<body class="d-flex">
	<%@ include file="../componentes/navbar.jsp"%>

	<div class="m-5 mh-100">
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
						<li><strong>Precio por Día:</strong> <%=auto.getPrecio_dia()%>
							USD</li>
					</ul>

					<!-- Botón con enlace -->
					<span href="#"
						class="btn <%=auto.getEstado().trim().equals("Disponible") ? "btn-success" : "btn-warning"%> w-100 mt-3"
						style="border-radius: 25px;"> <%=auto.getEstado()%>
					</span> 
				</div>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>

</body>
</html>