<%@ page import="modelo.clases.Cliente" %>

<% 
    Cliente cliente = (Cliente) request.getAttribute("cliente");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Modificar Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        /* Aseguramos que el contenido sea desplazable si es necesario */
        body {
            height: 100vh;
            overflow: hidden;
        }
        .container {
            max-height: 100%;
            overflow-y: auto; /* Permite el desplazamiento vertical */
        }
    </style>
</head>
<body class="d-flex w-100">
    <%@ include file="/componentes/navbar.jsp" %>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-10">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white text-center">
                        <h3>Modificar Cliente</h3>
                    </div>
                    <div class="card-body">
                        <form action="cliente?action=modificarCliente" method="post">
                            <input type="hidden" name="id" value="<%=cliente.getId()%>">
                            
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre</label>
                                <input type="text" id="nombre" name="nombre" class="form-control" value="<%=cliente.getNombre()%>" required>
                            </div>

                            <div class="mb-3">
                                <label for="documento" class="form-label">Documento</label>
                                <input type="text" id="documento" name="documento" class="form-control" value="<%=cliente.getDocumento()%>" required>
                            </div>

                            <div class="mb-3">
                                <label for="direccion" class="form-label">Dirección</label>
                                <input type="text" id="direccion" name="direccion" class="form-control" value="<%=cliente.getDireccion()%>" required>
                            </div>

                            <div class="mb-3">
                                <label for="telefono" class="form-label">Teléfono</label>
                                <input type="text" id="telefono" name="telefono" class="form-control" value="<%=cliente.getTelefono()%>" required>
                            </div>

                            <div class="mb-3">
                                <label for="correo" class="form-label">Correo</label>
                                <input type="email" id="correo" name="correo" class="form-control" value="<%=cliente.getCorreo()%>" required>
                            </div>

                            <button type="submit" class="btn btn-primary w-100">Modificar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

