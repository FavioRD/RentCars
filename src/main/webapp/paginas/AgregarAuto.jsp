<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="autos?action=agregarAuto" method="post">
    <!-- No es necesario pasar el id en un nuevo registro -->
    
    <label>Modelo</label>
    <input type="text" name="modelo" required>
    <input type="hidden" name="id" value="1" >
    
    <label>Marca</label>
    <input type="text" name="marca" required>
    
    <label>Color</label>
    <input type="text" name="color" required>
    
    <label>Año</label>
    <input type="number" name="anio" required>
    
    <label>Matrícula</label>
    <input type="text" name="matricula" required>
    
    <label>Precio por día</label>
    <input type="number" name="precioDia" step="0.01" required>
    
    <label>Estado</label>
    <select name="estado" required>
        <option value="Disponible">Disponible</option>
        <option value="Alquilado">Alquilado</option>
    </select>
    
    <label>Imagen</label>
    <input type="text" name="img">
    
    <button type="submit">Agregar</button>
</form>

</body>
</html>