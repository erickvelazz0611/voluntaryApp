<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tu perfil Admin</title>
    <!-- Se inserta la foto del logo de la empresa -->
    <link rel="shortcut icon" type="image/png"
          href="${pageContext.request.contextPath}/assets/images/logos_voluntariapp/logo_VOLUNTARIAPP.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/style_dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/sweetalert2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css/register.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
</head>

<body>
<!-- Incio del copipage Plantilla (DASHBOARD) -->
<!--  Body Wrapper -->
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <!-- localizatodo en su lugar -->
    <aside class="left-sidebar"> <!-- COLOR == | Fondo Barra Lateral Izquierdo | ==-->
        <!-- Sidebar scroll-->
        <!-- Localiza la barra superior en su lugar -->
        <div>
            <!-- Imagen del logo de la app -->
            <div class="brand-logo d-flex align-items-center justify-content-between">
                <a href="/admin/main" class="text-nowrap logo-img">
                    <!-- Logo parte superior izquierda -->
                    <img src="../../assets/images/logos_voluntariapp/logo_extend.png" style="width:180px" alt=""/>
                    <!-- Logo de la barra lateral -->
                </a>
                <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                    <i class="ti ti-x fs-8"></i>
                </div>
            </div>
            <!-- Fin Imagen del logo de la app -->

            <!-- Sidebar navigation-->
            <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
                <ul id="sidebarnav">
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Home</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/admin/main" aria-expanded="false">
                <span>
                  <i class="ti ti-layout-dashboard"></i>
                </span>
                            <span class="hide-menu">Panel Administrador</span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Usuarios</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/admin/administrators" aria-expanded="false">
                <span>
                  <i class="ti ti-user-star"></i>
                </span>
                            <span class="hide-menu">Administradores</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/admin/main-organ" aria-expanded="false">
                <span>
                  <i class="ti ti-building"></i>
                </span>
                            <span class="hide-menu">Organizaciones</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/admin/main-volunt" aria-expanded="false">
                <span>
                  <i class="ti ti-fall"></i>
                </span>
                            <span class="hide-menu">Voluntarios</span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Otros</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/admin/aprobe" aria-expanded="false">
                <span>
                  <i class="ti ti-check"></i>
                </span>
                            <span class="hide-menu">Aprobar</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/admin/porfile" aria-expanded="false">
                <span>
                  <i class="ti ti-user-circle"></i>
                </span>
                            <span class="hide-menu">Perfil</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!-- Sidebar End -->

    <!--  Main wrapper -->
    <div class="body-wrapper"> <!-- COLOR == | Fondo Central | ==-->
        <!--  Header Start -->
        <header class="app-header"> <!-- COLOR == | Barra Navegacion Superior | ==-->
            <nav class="navbar navbar-expand-lg navbar-light">
                <ul class="navbar-nav">
                    <li class="nav-item d-block d-xl-none">
                        <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                            <i class="ti ti-menu-2"></i>
                        </a>
                    </li>
                </ul>
                <!-- Nav parte superior de iconos -->
                <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
                    <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
                        <!-- Etiqueta para meter cosas -->

                        <li class="nav-item d-none d-lg-block">
                            <a class="nav-link nav-icon-hover" href="javascript:void(0)" data-bs-toggle="modal"
                               data-bs-target="#exampleModal">
                                <input type="text" name="textBuscar" class="form-control">
                                <i class="ti ti-search"></i>
                            </a>
                        </li>
                        <!-- Foto de perfil -->
                        <li class="nav-item dropdown">
                            <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2"
                               data-bs-toggle="dropdown"
                               aria-expanded="false">
                                <img src="data:image/jpeg;base64, ${base64Image}" alt="" class="rounded-circle" style="width:35px; height:35px" />
                            </a>
                            <!-- Menu desplegable del la Foto fe perfil -->
                            <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
                                 aria-labelledby="drop2">
                                <!-- COLOR == | Fondo Desplegable Foto Perfil | ==    (Codigo de arriba)  -->
                                <div class="message-body">
                                    <a href="/admin/porfile" class="d-flex align-items-center gap-2 dropdown-item">
                                        <i class="ti ti-user fs-6"></i>
                                        <p class="mb-0 fs-3">Mi perfil</p>
                                    </a>
                                    <a href="/user/login" class="btn btn-outline-primary mx-3 mt-2 d-block">Cerrar
                                        Sesion</a>
                                </div>
                            </div>
                            <!-- Fin del Menu desplegable del la Foto fe perfil -->
                        </li>
                        <!-- Fin Foto de perfil -->
                    </ul>
                </div>
            </nav>
        </header>
        <!-- Inicio Contenedor (Principal) -->
        <div class="container-fluid">

            <div class="row">
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
            </div>

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
                                    <h6>Infomación</h6>
                                    <hr class="mt-0 mb-4">
                                    <div class="row pt-1">

                                        <div class="row pt-1">
                                            <div class="col-6 mb-4">
                                                <div class="form-floating">
                                                    <h6>Nombre Completo</h6>
                                                    <c:out value="${admin.name}"/>
                                                </div>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <div class="form-floating">
                                                    <h6>Correo</h6>
                                                    <c:out value="${user.email}"/>
                                                </div>
                                            </div>
                                        </div>
                                        <!--
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <div class="form-floating">
                                                    <h6>Contraseña</h6>
                                                    <c:out value="${user.password}"/>
                                                </div>
                                            </div>
                                        </div>
                                        -->
                                        <!--=============== Inicio de los botones del Modal de Actualizar ===============-->
                                        <div class="row  pt-1 justify-content-center">
                                            <button type="button" class="btn btn-warning col-lg-6" data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal"
                                                    data-bs-whatever="@getbootstrap">
                                                Editar
                                            </button>
                                            <hr style="color: white">
                                            <!--=============== <form method="post" action="/admin/delete">===============-->
                                            <form action="/admin/deleteprofile" method="post" class="btn btn-danger col-lg-6">
                                                <input hidden value="${user.id_user}" name="id"/>
                                                <button class="btn btn-danger">
                                                    Eliminar
                                                </button>
                                            </form>
                                            <!--=============== </form>===============-->
                                        </div>

                                        <!--===============  Fin de los botones del Modal de Actualizar   ===============-->

                                        <!-- Modal -->
                                        <div class="row pt-8">
                                            <div class="modal fade" id="exampleModal" tabindex="-1"
                                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Actualización de
                                                                Perfil
                                                            </h5>
                                                            <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>

                                                        <div class="modal-body">
                                                        <form class="needs-validation" id="admin-form"
                                                              novalidate action="/admin/update" method="post" enctype="multipart/form-data">
                                                            <input hidden value="${admin.id_admin}" name="id_admin">
                                                            <div class="row">
                                                                <!-- Muestra el id del voluntario
                                                                <div class="col-md-6 mb-4">
                                                                      <div class="form-floating">
                                                                          <input type="text" name="id" id="id" class="form-control" value="" placeholder="name" disabled>

                                                                          <label for="id">Id</label>
                                                                      </div>
                                                                 </div>-->
                                                                <div class="col-md-0 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="text" name="name" id="name"
                                                                               class="form-control"
                                                                               value="${admin.name}"
                                                                               placeholder="name"
                                                                               required>
                                                                        <label for="name">Nombre
                                                                            completo</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-0 mb-4">
                                                                    <div class="form-floating">
                                                                        <input type="email" name="email" id="email"
                                                                               class="form-control"
                                                                               value="${user.email}"
                                                                               placeholder="email" required>
                                                                        <label for="email">Email</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
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
                                    </div>
                                    <!--  -->
                                </div>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.0.2/dist/sweetalert2.all.min.js"></script><script>
    // Función para mostrar la confirmación de SweetAlert
    function mostrarConfirmacion() {
        if (document.getElementById("admin-form").checkValidity()) {
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
                    document.getElementById('admin-form').submit();
                }
            });
        } else {
            document.getElementById("admin-form").classList.add('was-validated');
        }
    }

    // Función para enviar el formulario usando XMLHttpRequest
    function enviarFormulario() {
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "/admin/update", true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            if (xhr.status === 200) {
                // La solicitud se ha completado correctamente.
                // Aquí manejamos la respuesta del servidor y mostramos la alerta de éxito o error.
                if (xhr.responseText.includes("success")) {
                    mostrarAlerta('¡Éxito! Voluntario actualizado correctamente.', 'success', true);
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
        xhr.send(new URLSearchParams(new FormData(document.getElementById("admin-form"))));
    }

    // Función para mostrar la alerta de SweetAlert y redireccionar después del tiempo de auto-cierre
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
                window.location.href = "/user/login"; // Cambia la URL por la página a la que deseas redireccionar después del tiempo de auto-cierre.
            }
        });
    }
</script>
</body>
</html>