<%@page import="modelo.clases.Auto"%>
<%@page import="modelo.clases.Cliente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Auto auto = (Auto) request.getAttribute("auto");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Alquilar Auto</title>
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
						<h3>Alquilar Auto</h3>
					</div>
					<div class="card-body">
						<form action="alquilarAuto?accion=alquilar" method="post" class="needs-validation"
							novalidate>
							<!-- Selección de cliente -->
							<div class="mb-3">
								<label for="id_cliente" class="form-label">Cliente</label> <select
									id="id_cliente" name="id_cliente" class="form-select" required>
									<%
									List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
									%>
									<%
									if (clientes != null) {
									%>
									<%
									for (Cliente c : clientes) {
									%>
									<option value="<%=c.getId()%>"><%=c.getNombre()%></option>
									<%
									}
									%>
									<%
									}
									%>
								</select>
								<div class="invalid-feedback">Por favor, selecciona un
									cliente.</div>
							</div>

							<!-- Información del auto -->
							<div class="mb-3">
								<label for="auto" class="form-label">Auto</label> <input
									type="text" id="auto" name="auto" class="form-control"
									value="<%=auto.getMarca() + ' ' + auto.getModelo() + ' ' + auto.getMatricula()%>"
									disabled>
							</div>

							<input type="hidden" name="id_auto" value="<%=auto.getId()%>">

							<!-- Fechas de alquiler -->
							<div class="mb-3">
								<label for="fecha_inicio" class="form-label">Fecha de
									Inicio</label> <input type="date" id="fecha_inicio" name="fecha_inicio"
									class="form-control" required>
								<div class="invalid-feedback">Por favor, ingresa la fecha
									de inicio.</div>
							</div>

							<div class="mb-3">
								<label for="fecha_fin" class="form-label">Fecha de Fin</label> <input
									type="date" id="fecha_fin" name="fecha_fin"
									class="form-control" required>
								<div class="invalid-feedback">Por favor, ingresa la fecha
									de fin.</div>
							</div>

							<!-- Precio por día y total -->
							<div class="mb-3">
								<label for="precio_por_dia" class="form-label">Precio
									por Día</label> <input type="number" id="precio_por_dia"
									name="precio_por_dia" class="form-control"
									value="<%=auto.getPrecio_dia()%>" disabled>
							</div>

							<div class="mb-3">
								<label for="precio_total" class="form-label">Precio
									Total</label> <input type="number" id="precio_total"
									name="precio_total" class="form-control" step="0.01" required>
								<div class="invalid-feedback">Por favor, ingresa el precio
									total.</div>
							</div>

							<!-- Estado del alquiler -->
							<div class="mb-3">
								<label for="estado_alquiler" class="form-label">Estado
									del Alquiler</label> <select id="estado_alquiler"
									name="estado_alquiler" class="form-select" required>
									<option value="activo">Activo</option>
									<option value="finalizado">Finalizado</option>
									<option value="pendiente">Pendiente</option>
								</select>
								<div class="invalid-feedback">Por favor, selecciona el
									estado del alquiler.</div>
							</div>

							<!-- Botón de envío -->
							<button type="submit" class="btn btn-primary w-100">Alquilar
								Auto</button>
						</form>
					</div>
					
				</div>
				<a href="autos?action=verAutos" class="btn btn-secondary mt-3">Volver</a>
			</div>
		</div>
		
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        // Calcular precio total dinámicamente
        const fechaInicioInput = document.getElementById('fecha_inicio');
        const fechaFinInput = document.getElementById('fecha_fin');
        const precioPorDiaInput = document.getElementById('precio_por_dia');
        const precioTotalInput = document.getElementById('precio_total');

        function calcularPrecioTotal() {
            const fechaInicio = new Date(fechaInicioInput.value);
            const fechaFin = new Date(fechaFinInput.value);
            const precioPorDia = parseFloat(precioPorDiaInput.value);

            if (!isNaN(fechaInicio) && !isNaN(fechaFin) && fechaFin >= fechaInicio) {
                const diferenciaDias = (fechaFin - fechaInicio) / (1000 * 60 * 60 * 24);
                const precioTotal = diferenciaDias * precioPorDia;
                precioTotalInput.value = precioTotal.toFixed(2);
            } else {
                precioTotalInput.value = '';
            }
        }

        fechaInicioInput.addEventListener('change', calcularPrecioTotal);
        fechaFinInput.addEventListener('change', calcularPrecioTotal);

        // Validación del formulario
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