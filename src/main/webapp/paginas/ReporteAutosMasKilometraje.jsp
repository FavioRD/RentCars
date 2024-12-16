<%@page import="modelo.clases.Auto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Autos con Mayor Kilometraje</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Autos con Mayor Kilometraje</h1>
    <table class="table table-striped table-bordered mt-4">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Matrícula</th>
                <th>Marca</th>
                <th>Modelo</th>
                <th>Kilometraje</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Recuperar la lista de autos desde la request
                ArrayList<Auto> listaAutos = (ArrayList<Auto>) request.getAttribute("listaAutos");
                if (listaAutos != null && !listaAutos.isEmpty()) {
                    for (Auto auto : listaAutos) {
            %>
            <tr>
                <td><%= auto.getId() %></td>
                <td><%= auto.getMatricula() %></td>
                <td><%= auto.getMarca() %></td>
                <td><%= auto.getModelo() %></td>
                <td><%= auto.getKilometraje() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5" class="text-center">No hay datos disponibles</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
<!-- Bootstrap JS (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
