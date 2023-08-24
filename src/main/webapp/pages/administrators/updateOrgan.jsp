<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cuenta Voluntarios</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/register.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>

<body>
<a >
    <div class="text-md-start p-4">
        <img src="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_extend.png" style="width:200px" alt="">
    </div>
</a>
<div class="container-fluid d-flex align-items-center justify-content-center">
    <div class="container bg-white rounded shadow">
        <!-- shadow -->
        <div class="row align-items-stretch">
            <div class="col bg-white p-5 rounded-end">
                <h3 class="fw-bold text-center ">Actualizar</h3>
                <h4 class="fw-bold text-center c-blu">Organización</h4>
                <br>
                <!-- Register -->
                <form class="needs-validation" id="organ-form" novalidate action="${pageContext.request.contextPath}/organ/update-organ" method="post">
                    <input hidden value="${organ.id}" name="id">
                    <div class="row ">
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input name="bussines_name" type="text" id="bussines_name" class="form-control"
                                       placeholder="Empresa" required>
                                <label for="bussines_name">Empresa</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input name="rfc" type="text" id="rfc" class="form-control" placeholder="RFC" required>
                                <label for="rfc">RFC</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input name="state" type="text" id="state" class="form-control"
                                       placeholder="Estado"
                                       required>
                                <label for="state">Estado</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input name="municipality" type="text" id="municipality" class="form-control"
                                       placeholder="Municipio"
                                       required>
                                <label for="municipality">Municipio</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input name="postal_code" type="text" id="postal_code" class="form-control"
                                       placeholder="Código Postal"
                                       pattern="[0-9]+" required>
                                <label for="postal_code">Código Postal</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input name="cologne" type="text" id="cologne" class="form-control"
                                       placeholder="Colonia" required>
                                <label for="cologne">Colonia</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input name="street" type="text" id="street" class="form-control" placeholder="Calle"
                                       required>
                                <label for="street">Calle</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div class="form-floating">
                                <input name="phone" type="tel" id="phone" class="form-control" placeholder="Teléfono"
                                       pattern="[0-9]{10}" required>
                                <label for="phone">Teléfono</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-0 mb-4">
                            <div class="form-floating">
                                <input name="email" type="email" id="email" class="form-control" placeholder="Email"
                                       required>
                                <label for="email">Email</label>
                            </div>
                        </div>
                        <div class="col-md-0 mb-4">
                            <div class="form-floating form-control-icon">
                                <input type="password" id="password" name="password" class="form-control"
                                       placeholder="Contraseña"
                                       required>
                                <label for="password">Contraseña</label>
                                <div class="password-toggle" onclick="togglePasswordVisibility('password')">
                                    <i id="password-toggle-icon" class="bi bi-eye-slash"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-outline-primary">Crear Organización</button>
                    </div>
                    <br>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/register_login.js"></script>
<script>
    (function () {
        'use strict'
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')
        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
    })();
</script>
</body>

</html>