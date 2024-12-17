<%@page import="modelo.clases.Auto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Auto auto = (Auto) request.getAttribute("auto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrar Auto</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="d-flex w-100" style="height: 100vh; overflow: hidden;">
<%@ include file="/componentes/navbar.jsp"%>

<div class="container py-5">
    <h1 class="text-center mb-4">Borrar Auto</h1>
    <form action="autos?action=borrarAuto" method="post">
        <input type="hidden" name="id" value="<%=auto.getId()%>">

        <div class="row mb-3">
            <div class="col-12">
                <label for="marca" class="form-label">Marca</label>
                <input type="text" class="form-control" id="marca" disabled="disabled" value="<%=auto.getMarca()%>">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-12">
                <label for="modelo" class="form-label">Modelo</label>
                <input type="text" class="form-control" id="modelo" disabled="disabled" value="<%=auto.getModelo()%>">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-12">
                <label for="anio" class="form-label">Año</label>
                <input type="text" class="form-control" id="anio" disabled="disabled" value="<%=auto.getAnio()%>">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-12">
                <label for="color" class="form-label">Color</label>
                <input type="text" class="form-control" id="color" disabled="disabled" value="<%=auto.getColor()%>">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-12">
                <label for="matricula" class="form-label">Matrícula</label>
                <input type="text" class="form-control" id="matricula" disabled="disabled" value="<%=auto.getMatricula()%>">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-12">
                <label for="kilometraje" class="form-label">Kilometraje</label>
                <input type="text" class="form-control" id="kilometraje" disabled="disabled" value="<%=auto.getKilometraje()%>">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-12">
                <label for="precioDia" class="form-label">Precio por Día</label>
                <input type="text" class="form-control" id="precioDia" disabled="disabled" value="<%=auto.getPrecio_dia()%>">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-12">
                <label for="estado" class="form-label">Estado</label>
                <input type="text" class="form-control" id="estado" disabled="disabled" value="<%=auto.getEstado()%>">
            </div>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-danger">Borrar</button>
            <a href="autos?action=verAutos" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</div>

</body>
</html>
