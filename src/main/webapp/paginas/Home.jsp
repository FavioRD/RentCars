<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body class="d-flex"
	style="min-height: 100vh; background-color: #f8f9fa;">
	<%@ include file="/componentes/navbar.jsp"%>
	<%
	double totalAlquileres = (double) request.getAttribute("totalAlquileres");
	int cantidadAutos = (int) request.getAttribute("cantidadAutosTotales");
	int cantidadAutosAlquilados = (int) request.getAttribute("cantidadAutosAlquilados");
	%>

	<!-- Encabezado -->


	<!-- Contenedor principal -->
	<div class="container my-5">
		<header class="py-4 text-center">
			<h1 class="fw-bold">Bienvenido a Rent Car</h1>
			<p>En Rent Car podrás alquilar autos de la mejor calidad y al
				mejor precio.</p>
		</header>
		<div class="row justify-content-center">
			<!-- Card 1: Autos en tienda -->
			<div class="col-md-4 mb-4">
				<div class="card shadow-lg border-0 text-center">
					<div class="card-body bg-primary text-white rounded">
						<h5 class="card-title fw-bold">Autos en tienda</h5>
						<p class="display-4 m-0 fw-bold"><%=cantidadAutos%></p>
					</div>
				</div>
			</div>


			<%
			HttpSession sesionHome = request.getSession();
			Usuario usuarioHome = (Usuario) sesion.getAttribute("usuario");
			%>
			<%
			if (usuarioHome.getRol().equals("Administrador")){
			%>
			<!-- Card 2: Total generado en el último mes -->
			<div class="col-md-4 mb-4">
				<div class="card shadow-lg border-0 text-center">
					<div class="card-body bg-success text-white rounded">
						<h5 class="card-title fw-bold">Total generado en el último
							mes</h5>
						<p class="display-4 m-0 fw-bold">
							S/<%=String.format("%.2f", totalAlquileres)%></p>
					</div>
				</div>
			</div>

			<%
            }
			            %>

			<!-- Card 3: Autos alquilados -->
			<div class="col-md-4 mb-4">
				<div class="card shadow-lg border-0 text-center">
					<div class="card-body bg-warning text-dark rounded">
						<h5 class="card-title fw-bold">Autos Alquilados</h5>
						<p class="display-4 m-0 fw-bold"><%=cantidadAutosAlquilados%></p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>

</html>