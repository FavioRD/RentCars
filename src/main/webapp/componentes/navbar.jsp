<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="d-flex flex-column bg-info-subtle h-100 w-25 vh-100">
		<!-- Título en la parte superior -->
		<div class="text-center py-5 border-bottom">
			<a href="${pageContext.request.contextPath}/index.jsp">Rent Car</>
		</div>

		<!-- Menú que ocupa el espacio restante -->
		<ul
			class="d-flex flex-column justify-content-center gap-3 list-unstyled w-100 px-3 mb-0 flex-grow-1">
			<li class="mb-2"><a href="${pageContext.request.contextPath}/paginas/AgregarAuto.jsp"
				class="text-decoration-none d-block py-4 px-3 bg-light rounded">Agregar
					Auto</a></li>
			<li class="mb-2"><a href="${pageContext.request.contextPath}/verAutos"
				class="text-decoration-none d-block py-4 px-3 bg-light rounded">Ver
					Autos</a></li>
			<li class="mb-2"><a href="${pageContext.request.contextPath}paginas/BorrarAuto.jsp"
				class="text-decoration-none d-block py-4 px-3 bg-light rounded">Borrar
					Auto</a></li>
			<li class="mb-2"><a href="${pageContext.request.contextPath}/paginas/ModificarAuto.jsp"
				class="text-decoration-none d-block py-4 px-3 bg-light rounded">Modificar
					Auto</a></li>
			<li class="mb-2"><a href="${pageContext.request.contextPath}/paginas/VerAlquilados.jsp"
				class="text-decoration-none d-block py-4 px-3 bg-light rounded">Ver
					Autos Alquilados</a></li>
			<li><a href="${pageContext.request.contextPath}/paginas/AlquilarAuto.jsp"
				class="text-decoration-none d-block py-4 px-3 bg-light rounded">Alquilar
					Auto</a></li>
		</ul>


	</nav>
</body>
</html>