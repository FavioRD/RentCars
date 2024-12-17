<%@page import="modelo.clases.Usuario"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Sidebar con Bootstrap</title>
    <!-- Bootstrap 5.3 -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <!-- Sidebar -->
    <nav
      class="d-flex flex-column bg-light shadow-sm"
      style="width: 250px; min-width: 250px"
    >
      <!-- Logo -->
      <div class="text-center py-4 border-bottom">
        <a
          href="${pageContext.request.contextPath}/controlador?action=volverInicio"
        >
          <img
            src="https://media.istockphoto.com/id/1290071290/vector/rental-car-icon.jpg?s=612x612&w=0&k=20&c=q4EsvU3jJJYbcZTJ1EzKh6c-Dvy39HagvAUgTCRK9bE="
            alt="Logo"
            class="rounded-circle"
            style="width: 100px; height: 100px; object-fit: cover"
          />
        </a>
        <h5 class="mt-2">Rent Car</h5>
      </div>

      <!-- Menu Items -->
      <ul class="nav flex-column px-2 flex-grow-1">
        <% HttpSession sesion = request.getSession(); Usuario usuario =
        (Usuario) sesion.getAttribute("usuario"); %>

        <!-- Mantenimiento Auto -->
        <% if (usuario.getRol().trim().equals("Administrador")) { %>
        <li class="nav-item mt-3">
          <h6 class="text-uppercase text-secondary px-2">Mantenimiento Auto</h6>
        </li>
        <li class="nav-item">
          <a href="autos?action=agregarAuto" class="nav-link text-dark ps-3">
            <i class="bi bi-plus-circle me-2"></i> Agregar Auto
          </a>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link text-dark ps-3">
            <i class="bi bi-trash me-2"></i> Borrar Auto
          </a>
        </li>
        <li class="nav-item">
          <a
            href="${pageContext.request.contextPath}/autos?action=verAutos"
            class="nav-link text-dark ps-3"
          >
            <i class="bi bi-list-task me-2"></i>
            Listar Autos
          </a>
        </li>
        <% } %>

        <!-- Ver Autos Alquilados -->
        <li class="nav-item mt-3">
          <h6 class="text-uppercase text-secondary px-2">Autos</h6>
        </li>
        <li class="nav-item">
          <a href="autos?action=verAlquilados" class="nav-link text-dark ps-3">
            <i class="bi bi-eye me-2"></i>
            Ver Autos Alquilados
          </a>
        </li>

        <!-- Mantenimiento Clientes -->
        <li class="nav-item mt-3">
          <h6 class="text-uppercase text-secondary px-2">Clientes</h6>
        </li>
        <li class="nav-item">
          <a
            href="${pageContext.request.contextPath}/cliente"
            class="nav-link text-dark ps-3"
          >
            <i class="bi bi-people me-2"></i>
            Mantenimiento Clientes
          </a>
        </li>
        <li class="nav-item">
          <a
            href="${pageContext.request.contextPath}/cliente?action=agregarCliente"
            class="nav-link text-dark ps-3"
          >
            <i class="bi bi-person-plus-fill me-2"></i> Agregar Cliente
          </a>
        </li>

        <!-- Reportes -->
        <li class="nav-item mt-3">
          <h6 class="text-uppercase text-secondary px-2">Reportes</h6>
        </li>
        <li class="nav-item">
          <a
            href="autos?action=autosConMasKilometraje"
            class="nav-link text-dark ps-3"
          >
            <i class="bi bi-speedometer2 me-2"></i> Autos con más Kilometraje
          </a>
        </li>
        <li class="nav-item">
          <a
            href="cliente?action=reporteClientes"
            class="nav-link text-dark ps-3"
          >
            <i class="bi bi-bar-chart me-2"></i>
            Clientes que más Alquilaron
          </a>
        </li>
      </ul>

      <!-- Cerrar Sesión -->
      <div class="border-top py-3 px-3">
        <a
          href="${pageContext.request.contextPath}/controlador?action=cerrarSesion"
          class="btn btn-danger w-100 d-flex justify-content-center align-items-center"
        >
          <i class="bi bi-box-arrow-left me-2"></i> Cerrar Sesión
        </a>
      </div>
    </nav>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
  </body>
</html>
