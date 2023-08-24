<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VoluntariApp Perfil</title>
    <jsp:include page="../../layouts/head.jsp"/>
</head>
<body>
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">
    <aside class="left-sidebar">
        <div>
            <div class="brand-logo d-flex align-items-center justify-content-between">
                <a href="/organ/main" class="text-nowrap logo-img">
                    <!-- Logo parte superior izquierda -->
                    <img src="../../assets/images/logos_voluntariapp/logo_extend.png" style="width:180px"
                         alt=""/><!-- Logo de la barra lateral -->
                </a>
                <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                    <i class="ti ti-x fs-8"></i>
                </div>
            </div>
            <jsp:include page="../../layouts/sidebar.jsp"/>
        </div>
    </aside>
    <div class="body-wrapper">
        <header class="app-header">
            <jsp:include page="../../layouts/navbar.jsp"/>
        </header>


        <!--        ======================                Inicio Contenedor (Principal)              ========================         -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="d-flex align-items-center gap-2 dropdown-item">
                        <i class="ti ti-user-circle fs-6"></i>
                        <p class="mb-0 fs-3">Perfil</p>
                        <br><br>
                    </div>
                </div>
            </div>
            <hr>

            <div class="row d-flex justify-content-center align-items-center w-100 h-100">
                <div class="col col-lg-0 mb-4 mb-lg-0">
                    <div class="card mb-3" style="border-radius: .5rem;">
                        <div class="row g-0">
                            <div class="col-md-4 gradient-custom text-center text-white"
                                 style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem; position: relative;">
                                <img src="data:image/jpeg;base64, ${base64Image}" alt="Imagen" class="img-fluid my-5"
                                     style="width: 130px; border-radius: 50%;"/>
                                <i class="ti ti-user"></i>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body p-4">
                                    <h6>Información</h6>
                                    <hr class="mt-0 mb-4">
                                    <div class="row pt-1">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <h6>Nombre de Organización</h6>
                                                <c:out value="${organ.bussines_name}"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <h6>RFC</h6>
                                                <c:out value="${organ.rfc}"></c:out>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row pt-1">
                                        <div class="col-6 mb-4">
                                            <div class="form-floating">
                                                <h6>Estado</h6>
                                                <c:out value="${organ.state}"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <h6>Municipio</h6>
                                                <c:out value="${organ.municipality}"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row pt-1">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <h6>Código postal</h6>
                                                <c:out value="${organ.postal_code}"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <h6>Calle</h6>
                                                <c:out value="${organ.street}"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row pt-1">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <h6>Colonia</h6>
                                                <c:out value="${organ.cologne}"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <h6>Telefono</h6>
                                                <c:out value="${organ.phone}"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row pt-1">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <h6>Email</h6>
                                                <c:out value="${user.email}"/>
                                            </div>
                                        </div>

                                    </div>
                                    <!--=============== Inicio de los botones del Modal de Actualizar ===============-->
                                    <div class="row  pt-1 justify-content-center">
                                        <button type="button" class="btn btn-warning col-lg-6" data-bs-toggle="modal"
                                                data-bs-target="#exampleModal"
                                                data-bs-whatever="@getbootstrap">
                                            Editar
                                        </button>
                                        <hr style="color: white">
                                        <!--Parte de Jassiel -->
                                        <form action="/organ/delete" method="post" class="col-lg-6">
                                            <input type="hidden" id="user_id" name="user_id" value="<%=session.getAttribute("userId")%>" class="form-control">
                                            <button type="submit" class="btn btn-danger w-100">
                                                Eliminar cuenta
                                            </button>
                                        </form>
                                    </div>
                                    <!--===============  Fin de los botones del Modal de Actualizar   ===============-->


                                    <!--  ===============      Inicio del Modal de Actualizar      ===============  -->
                                    <div class="row pt-8">
                                        <div class="modal fade" id="exampleModal" tabindex="-1"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Actualización de
                                                            Perfil
                                                        </h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form class="needs-validation" id="organ-form" novalidate
                                                              action="/organ/update" method="post" enctype="multipart/form-data">
                                                            <input hidden value="${organ.id}" name="id">

                                                            <div class="row ">

                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="text" name="bussines_name"
                                                                               id="bussines_name" class="form-control"
                                                                               value="${organ.bussines_name}"
                                                                               placeholder="bussines_name" required>
                                                                        <label for="bussines_name">Empresa</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="text" name="municipality"
                                                                               id="rfc"
                                                                               value="${organ.rfc}"
                                                                               class="form-control"
                                                                               placeholder="rfc"
                                                                               disabled>
                                                                        <label for="rfc">RFC</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="text" name="municipality"
                                                                               id="municipality"
                                                                               value="${organ.municipality}"
                                                                               class="form-control"
                                                                               placeholder="municipality"
                                                                               required>
                                                                        <label for="municipality">Municipio</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="text" name="state"
                                                                               id="state"
                                                                               value="${organ.state}"
                                                                               class="form-control"
                                                                               placeholder="state"
                                                                               required>
                                                                        <label for="state">Estado</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="text" name="postal_code"
                                                                               id="postal_code"
                                                                               value="${organ.postal_code}"
                                                                               pattern="[0-9]{5}"
                                                                               class="form-control"
                                                                               placeholder="latanme"
                                                                               required>
                                                                        <label for="postal_code">Código postal</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="text" name="cologne" id="cologne"
                                                                               class="form-control"
                                                                               placeholder="cologne"
                                                                               value="${organ.cologne}" required>
                                                                        <label for="cologne">Colonia</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="text" name="street" id="street"
                                                                               class="form-control"
                                                                               value="${organ.street}"
                                                                               placeholder="street"
                                                                               required>
                                                                        <label for="street">Calle</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="text" name="phone" id="phone"
                                                                               value="${organ.phone}"
                                                                               pattern="[0-9]{10}"
                                                                               class="form-control" required>
                                                                        <label for="phone">Teléfono</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-0 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="email" name="email" id="email"
                                                                               value="${user.email}"
                                                                               class="form-control" required>
                                                                        <label for="email">Email</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-0 mb-4">
                                                                    <div class="form-floating form-control-icon">
                                                                        <input name="password" type="password"
                                                                               id="password" value="${user.password}"
                                                                               class="form-control"
                                                                               placeholder="Contraseña" required/>
                                                                        <span class="password-toggle"
                                                                              onclick="togglePasswordVisibility('password')">
                                                                            <i id="password-toggle-icon"
                                                                               class="bi bi-eye-slash"></i>
                                                                        </span>
                                                                        <label for="password">Contraseña</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-0 mb-4">
                                                                    <div class="form-floating form-control-icon">
                                                                        <input name="profilePic" type="file"
                                                                               id="profilePicupload"
                                                                               class="form-control"/>
                                                                        <label for=profilePicupload>Cambiar foto</label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger btn-sm"
                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                    Cancelar
                                                                </button>
                                                                <button type="button" class="btn btn-warning btn-sm"
                                                                        onclick="mostrarConfirmacion()">
                                                                    Actualizar
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--  ===============       Fin del Modal de Actualizar      ===============  -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fin Contenedor (Principal) -->
    </div>
</div>
<!-- JS -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/sidebarmenu.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.min.js"></script>
<!-- Estadisticas Library -->
<script>
    function togglePasswordVisibility(inputId) {
        var passwordInput = document.getElementById(inputId);
        var passwordToggleIcon = document.getElementById(inputId + '-toggle-icon');

        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            passwordToggleIcon.classList.remove('bi-eye-slash');
            passwordToggleIcon.classList.add('bi-eye');
        } else {
            passwordInput.type = "password";
            passwordToggleIcon.classList.remove('bi-eye');
            passwordToggleIcon.classList.add('bi-eye-slash');
        }
    }
</script>
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
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<!-- Sweet Alert JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.0.2/dist/sweetalert2.all.min.js"></script>
<script>
    // Función para mostrar la confirmación de SweetAlert
    function mostrarConfirmacion() {
        if (document.getElementById("organ-form").checkValidity()) {
            Swal.fire({
                title: '¿Estás seguro?',
                text: 'Se realizarán los cambios. ¿Estás seguro de continuar?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí',
                cancelButtonText: 'Cancelar',
            }).then((result) => {
                if (result.isConfirmed) {
                    // Si el usuario hace clic en "Sí", procedemos a enviar el formulario manualmente.
                    document.getElementById('organ-form').submit();
                }
            });
        } else {
            document.getElementById("organ-form").classList.add('was-validated');
        }
    }

    // Función para enviar el formulario usando XMLHttpRequest
    function enviarFormulario() {
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "/organ/update", true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            if (xhr.status === 200) {
                // La solicitud se ha completado correctamente.
                // Aquí manejamos la respuesta del servidor y mostramos la alerta de éxito o error.
                if (xhr.responseText.includes("success")) {
                    mostrarAlerta('¡Éxito! Organización actualizada correctamente.', 'success', true);
                } else {
                    mostrarAlerta('¡Error! Acción no realizada correctamente.', 'error', false);
                }
            } else {
                // Ha ocurrido un error al realizar la solicitud.
                mostrarAlerta('Error al enviar el formulario', 'error', false);
            }
        };
        xhr.onerror = function () {
            // Ha ocurrido un error al realizar la solicitud.
            mostrarAlerta('Error al enviar el formulario', 'error', false);
        };
        xhr.send(new URLSearchParams(new FormData(document.getElementById("organ-form"))));
    }

    // Función para mostrar la alerta de SweetAlert y redireccionar después del tiempo de
    function mostrarAlerta(mensaje, tipo, redireccionar) {
        Swal.fire({
            title: mensaje,
            icon: tipo,
            timer: redireccionar ? 5000 : undefined, // Tiempo en milisegundos (5 segundos) si es éxito, undefined si es error
            text: 'Se te redireccionara al Inicio de Sesion!',
            timerProgressBar: true, // Muestra una barra de progreso durante el tiempo de espera
            showConfirmButton: false, // No muestra el botón de confirmación en la alerta
        }).then(() => {
            if (redireccionar) {
                window.location.href = "/user/login"; // Cambia la URL por la página a la que deseas redireccionar después del tiempo.
            }
        });
    }
</script>
</body>

</html>