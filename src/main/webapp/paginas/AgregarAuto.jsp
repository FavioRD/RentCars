<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agregar Auto</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-6 col-md-8">
				<div class="card shadow">
					<div class="card-header text-center bg-primary text-white">
						<h3>Agregar Auto</h3>
					</div>
					<div class="card-body">
						<form action="autos?action=agregarAuto" method="post">
							<!-- Modelo -->
							<div class="mb-3">
								<label for="modelo" class="form-label">Modelo</label> <input
									type="text" class="form-control" id="modelo" name="modelo"
									required>
							</div>

							<!-- Marca -->
							<div class="mb-3">
								<label for="marca" class="form-label">Marca</label> <input
									type="text" class="form-control" id="marca" name="marca"
									required>
							</div>

							<!-- Color -->
							<div class="mb-3">
								<label for="color" class="form-label">Color</label> <input
									type="text" class="form-control" id="color" name="color"
									required>
							</div>

							<!-- Año -->
							<div class="mb-3">
								<label for="anio" class="form-label">Año</label> <input
									type="number" class="form-control" id="anio" name="anio"
									required>
							</div>

							<!-- Matrícula -->
							<div class="mb-3">
								<label for="matricula" class="form-label">Matrícula</label> <input
									type="text" class="form-control" id="matricula"
									name="matricula" required>
							</div>

							<!-- Precio por día -->
							<div class="mb-3">
								<label for="precioDia" class="form-label">Precio por día</label>
								<input type="number" class="form-control" id="precioDia"
									name="precioDia" step="0.01" required>
							</div>
							
							<div class="mb-3">
								<label for="kilometraje" class="form-label">Kilometraje KM</label>
								<input type="number" class="form-control" id="kilometraje"
									name="kilometraje" step="0.01" required>
							</div>

							<!-- Estado -->
							<input type="hidden" value="Disponible" name="estado"> <input
								type="hidden" value="1" name="idD">

							<!-- Imagen -->
							<div class="mb-3">
								<label for="img" class="form-label">Imagen (URL)</label> <input
									type="text" class="form-control" id="img" name="img">
							</div>
							
							

							<div class="d-grid">
								<button type="submit" class="btn btn-primary">Agregar</button>
							</div>
						</form>
					</div>
				</div>
				<a href="autos?action=verAutos" class="btn btn-secondary mt-3">Volver</a>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
