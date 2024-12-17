<%@ page import="modelo.clases.Cliente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Registro de Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="d-flex w-100" style="height: 100vh; overflow: hidden;">
    <%@ include file="/componentes/navbar.jsp"%>

    <div class="container mt-4">
        <h2 class="mb-4 text-center">Formulario de Registro de Cliente</h2>

        <form action="cliente?action=agregarCliente" method="post" class="row g-3">
            <input type="hidden" value="1" name="id">

            <div class="col-md-6">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" id="nombre" name="nombre" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label for="documento" class="form-label">Documento de Identidad:</label>
                <input type="text" id="documento" name="documento" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label for="direccion" class="form-label">Dirección:</label>
                <input type="text" id="direccion" name="direccion" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label for="telefono" class="form-label">Teléfono:</label>
                <input type="tel" id="telefono" name="telefono" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label for="correo" class="form-label">Correo Electrónico:</label>
                <input type="email" id="correo" name="correo" class="form-control" required>
            </div>

            <div class="col-12 text-center">
                <button type="submit" class="btn btn-primary mt-3">Registrar Cliente</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
