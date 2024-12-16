<%@page import="modelo.clases.Auto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Auto auto = (Auto) request.getAttribute("auto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modificar Auto</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="bg-light">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-6 col-md-8 col-sm-10">
				<div class="card shadow-sm">
					<div class="card-header bg-primary text-white text-center">
						<h3>Modificar Auto</h3>
					</div>
					<div class="card-body">
						<!-- Imagen del auto -->
						<div class="text-center mb-4">
							<img src="<%=auto.getImg()%>" alt="Imagen del Auto"
								class="img-fluid rounded"
								style="max-height: 200px; object-fit: cover;">
						</div>

						<form action="autos?action=modificarAuto" method="post"
							class="needs-validation" novalidate>
							<input type="hidden" name="id" value="<%=auto.getId()%>">

							<div class="mb-3">
								<label for="modelo" class="form-label">Modelo</label> <input
									type="text" id="modelo" name="modelo" class="form-control"
									value="<%=auto.getModelo()%>" required>
								<div class="invalid-feedback">Por favor, ingresa el
									modelo.</div>
							</div>

							<div class="mb-3">
								<label for="marca" class="form-label">Marca</label> <input
									type="text" id="marca" name="marca" class="form-control"
									value="<%=auto.getMarca()%>" required>
								<div class="invalid-feedback">Por favor, ingresa la marca.</div>
							</div>

							<div class="mb-3">
								<label for="color" class="form-label">Color</label> <input
									type="text" id="color" name="color" class="form-control"
									value="<%=auto.getColor()%>" required>
								<div class="invalid-feedback">Por favor, ingresa el color.</div>
							</div>

							<div class="mb-3">
								<label for="anio" class="form-label">Año</label> <input
									type="text" id="anio" name="anio" class="form-control"
									value="<%=auto.getAnio()%>" required>
								<div class="invalid-feedback">Por favor, ingresa el año.</div>
							</div>

							<div class="mb-3">
								<label for="matricula" class="form-label">Matrícula</label> <input
									type="text" id="matricula" name="matricula"
									class="form-control" value="<%=auto.getMatricula()%>" required>
								<div class="invalid-feedback">Por favor, ingresa la
									matrícula.</div>
							</div>

							<div class="mb-3">
								<label for="precioDia" class="form-label">Precio por Día</label>
								<input type="text" id="precioDia" name="precioDia"
									class="form-control" value="<%=auto.getPrecio_dia()%>" required>
								<div class="invalid-feedback">Por favor, ingresa el precio
									por día.</div>
							</div>

							<div class="mb-3">
								<label for="estado" class="form-label">Estado</label> <select
									id="estado" name="estado" class="form-select" required>
									<option value="Disponible"
										<%=auto.getEstado().equals("Disponible") ? "selected" : ""%>>Disponible</option>
									<option value="Alquilado"
										<%=auto.getEstado().equals("Alquilado") ? "selected" : ""%>>Alquilado</option>
								</select>
								<div class="invalid-feedback">Por favor, selecciona el
									estado.</div>
							</div>

							<div class="mb-3">
								<label for="img" class="form-label">Imagen (URL)</label> <input
									type="text" id="img" name="img" class="form-control"
									value="<%=auto.getImg()%>" required>
								<div class="invalid-feedback">Por favor, ingresa el URL de
									la imagen.</div>
							</div>

							<div class="mb-3">
								<label for="kilometraje" class="form-label">Kilometraje</label>
								<input type="number" id="kilometraje" name="kilometraje"
									class="form-control" value="<%=auto.getKilometraje()%>"
									required>
								<div class="invalid-feedback">Por favor, ingresa un
									kilometraje valido</div>
							</div>


							<button type="submit" class="btn btn-primary w-100">Guardar
								Cambios</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        // Script para activar la validación de formularios de Bootstrap
        (() => {
            'use strict';
            const forms = document.querySelectorAll('.needs-validation');
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>
</html>